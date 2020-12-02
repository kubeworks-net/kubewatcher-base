let commonChartsJs = (function () {
    let chartMap = new Map();
    let scheduleMap = new Map();
    let readyTimestamp = new Date().getTime();
    let defaultIntervalMillis = 60 * 1000;
    let gaugeOptions = {
        chart: {
            type: 'solidgauge'
        },
        pane: {
            center: ['50%', '85%'],
            size: '150%',
            startAngle: -90,
            endAngle: 90,
            background: {
                backgroundColor:
                    Highcharts.defaultOptions.legend.backgroundColor || '#EEE',
                innerRadius: '60%',
                outerRadius: '100%',
                shape: 'arc'
            }
        },

        exporting: {
            enabled: false
        },
        credits: {
            enabled: false
        },
        tooltip: {
            enabled: false
        },
        // the value axis
        yAxis: {
            stops: [
                [0.1, '#55BF3B'], // green
                [0.5, '#DDDF0D'], // yellow
                [0.9, '#DF5353'] // red
            ],
            lineWidth: 0,
            tickWidth: 0,
            minorTickInterval: null,
            tickAmount: 2,
            title: {
                y: -70
            },
            labels: {
                y: 16
            }
        },

        plotOptions: {
            solidgauge: {
                dataLabels: {
                    y: 5,
                    borderWidth: 0,
                    useHTML: true
                }
            }
        }
    }

    function loadSolidGaugeChartData(serise, dataItem) {
        const value = dataItem.value;
        if (value === undefined || value.length < 2) {
            console.warn("failed chart reload // empty reload data")
            return;
        }
        serise.points[0].update(parseFloat(value[1]).toFixed(2) - 0);
    }

    function loadLineChartData(serise, tagetLegend, resultType, dataItem) {
        if (dataItem === undefined || dataItem.length < 2) {
            console.error("failed chart reload // empty reload data")
            return;
        }
        if (Mustache.render(tagetLegend, dataItem.metric) === serise.name) {
            if (resultType === 'matrix') {
                dataItem.values.forEach(arr => {
                    serise.addPoint([
                        arr[0] * 1000,
                        parseFloat(arr[1]).toFixed(2) - 0
                    ], true, true);
                })
            } else {
                dataItem.value.forEach(arr => {
                    serise.addPoint([
                        arr[0] * 1000,
                        parseFloat(arr[1]).toFixed(2) - 0
                    ], true, true);
                })
            }
        }
    }
    // 스파크라인 차트 추가
    function loadSparkLineChartData(serise, tagetLegend, resultType, dataItem) {
        if (dataItem === undefined || dataItem.length < 2) {
            console.error("failed chart reload // empty reload data")
            return;
        }
        if (Mustache.render(tagetLegend, dataItem.metric) === serise.name) {
            if (resultType === 'matrix') {
                dataItem.values.forEach(arr => {
                    //시리즈의 마지막 데이터
                    let lastPoint = serise.points[serise.points.length - 1];

                    serise.addPoint([
                        arr[0] * 1000,
                        parseFloat(arr[1]).toFixed(2) - 0
                    ], true, true);
                    let chart = serise.chart;

                    let lastVal = addSparkUnitFormat(lastPoint.y);
                    chart.customText.attr({
                        //시리즈의 마지막 데이터 y 값 갱신
                        text: lastVal
                    })

                })
            } else {
                dataItem.value.forEach(arr => {
                    serise.addPoint([
                        arr[0] * 1000,
                        parseFloat(arr[1]).toFixed(2) - 0
                    ], true, true);
                })
            }
        }
    }

    function convertSumBadgeData(dataArray) {
        return dataArray.map(item => {
            if (item.data.resultType === 'matrix') {
                console.warn("unsupported result type=" + item.data.data.resultType);
                return 0;
            }
            return item.data.result.map(resultItem =>
                parseInt(resultItem.value[1]));
        }).reduce((value1, value2) => value1 + value2)[0];
    }

    function renderTable(panel, tableData) {
        if (tableData === undefined) {
            $('#container-' + panel.panelId)
                .html('<thead><tr><th>No Result</th></tr></thead>');
            return;
        }

        const headers = tableData.headers;
        const dataArray = tableData.data;
        const tableHeaderHtml = String.prototype.concat('<thead><tr>',
            headers.map(value => '<th>' + value + '</th>').join(''),
            '</tr></thead>');
        const tableBodyHtml = String.prototype.concat('<tbody>',
            dataArray.map(item => {
                let trAppend = '';
                for (let header of headers) {
                    trAppend += '<td>' + item[header] + '</td>';
                }
                return String.prototype.concat('<tr>', trAppend, '</tr>');
            }), '</tbody>');
        $('#container-' + panel.panelId).html(tableHeaderHtml + tableBodyHtml);
    }

    //어플리케이션 현황판용 테이블 추가, 어플리케이션 느림 상태 업데이트 추가 해야
    function renderAppTable(panel, tableData) {
        if (tableData === undefined) {
            $('#container-' + panel.panelId)
                .html('<thead><tr><th>No Result</th></tr></thead>');
            return;
        }
        const headers = tableData.headers;
        const dataArray = tableData.data;
        let trAppend = '';
        let itemCount = 0;
        let okCount = 0;
        let errorCount = 0;
        let slowCount = 0;
        const tableBodyHtml = String.prototype.concat('<tbody class="table_mini">',
            dataArray.map(item => {
                for (let header of headers) {
                    if (header != 'application' && item[header] == '1') {
                        trAppend += '<td><div class="box_mini_g">' + item['application'] + '</div></td>';
                        okCount++;
                    } else if (header != 'application' && item[header] == '0') {
                        trAppend += '<td><div class="box_mini_r">' + item['application'] + '</div></td>';
                        errorCount++;
                    }
                }
                itemCount++;
                //5 컬럼
                if (itemCount == 4) {
                    itemCount = 0;
                    let tdEnd = trAppend;
                    trAppend = '';
                    return String.prototype.concat('<tr>', tdEnd, '</tr>');
                }
            }), '</tbody>');

        let tableBottomHtml = '<tbody class="table_mini mt_10">';
        tableBottomHtml+= '<td>전체 :'+tableData.data.length+'</td>';
        tableBottomHtml+= '<td><div class="circle c_normal"></div> 정상 : '+okCount+'</td>';
        tableBottomHtml+= '<td><div class="circle c_danger"></div> 오류 : '+errorCount+'</td>';
        tableBottomHtml+= '<td><div class="circle c_warning"></div> 느림 : '+slowCount+'</td>';
        tableBottomHtml+= '</tbody>';

        $('#container-' + panel.panelId).html(tableBodyHtml+tableBottomHtml);
    }

    function convertTableData(data) {
        if (data === undefined || data.length === 0) {
            return undefined;
        }

        let result = {};
        if (!Array.isArray(data)) {
            data = [data];
        }
        result.headers = Object.keys(data[0]);
        result.data = data.map(value => value);
        return result;
    }
    //스파크라인 차트 최초 생성시 마지막 데이터값 그려주는 함수
    function drawOneLabel(chart, series, unit) {
        let render = chart.renderer;
        let v = series[0].points[series[0].points.length - 1];
        let lastVal = addSparkUnitFormat(v.y, unit);
        chart.customText = render.label(lastVal, chart.plotWidth / 2, chart.plotHeight / 2).css({
            color: '#FFFFFF',
            fontSize: 40
        }).attr({
            zIndex: 5,
            align: 'center'
        }).add();
    }
    //스파크라인 차트용 포맷
    function addSparkUnitFormat(str, unit) {
        str = String(str);
        if (unit == '%') {
            var cFloat = parseFloat(str);
            cFloat = cFloat.toFixed(1);
            str = cFloat+'%';
        } else if (unit == 'float'){
            var minus = str.substring(0, 1);
            str = str.replace(/[^\d]+/g, '');
            str = str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
            if (minus == "-") str = "-" + str;
        } else if (unit == 'bytes') {
            var bFloat = parseFloat(str);
            var mibValue = bFloat / 1024 / 1024;
            mibValue = mibValue.toFixed(1);
            str = mibValue+'MiB';
        } else if (unit == 'sec') {
            var sFloat = parseFloat(str);
            sFloat = sFloat.toFixed(1);
            str = sFloat+' s'
        }
        // if (str.indexOf(".") != -1) {
        //     var cFloat = parseFloat(str);
        //     cFloat = cFloat.toFixed(1);
        //     str = cFloat+'%';
        // } else {
        //     var minus = str.substring(0, 1);
        //     str = str.replace(/[^\d]+/g, '');
        //     str = str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
        //     if (minus == "-") str = "-" + str;
        // }
        return str;
    }

    return {
        createPanel: function (panel) {
            if (panel.refreshIntervalMillis === undefined || panel.refreshIntervalMillis <= 0) {
                panel.refreshIntervalMillis = defaultIntervalMillis;
            }
            panel.readyTimestamp = readyTimestamp;
            const panelType = panel.panelType;
            switch (panelType) {
                case "CHART":
                    if (panel.chartQueries.length > 0) {
                        this.getDataByPanel(panel, true)
                            .then(responses => this.convertSeries(panel, responses))
                            .then(series => this.getChartData(panel, series))
                            .then(chartOptions => this.renderChart(panel, chartOptions));
                    }
                    break;
                case "TABLE":
                    this.getDataByPanel(panel, true)
                        .then(value => this.createTable(panel, value))
                        .then(panel => scheduleMap.set(panel.panelId,
                            setTimeout(commonChartsJs.refreshFunction, panel.refreshIntervalMillis, panel))
                        )
                    break;
                case "BADGE":
                    this.getDataByPanel(panel, true)
                        .then(value => this.createBadge(panel, value))
                        .then(panel => scheduleMap.set(panel.panelId,
                            setTimeout(commonChartsJs.refreshFunction, panel.refreshIntervalMillis, panel))
                        );
                    break;
                case "UPDOWN":
                    this.getDataByPanel(panel)
                        .then(value => this.createUpDown(panel, value))
                        .then(panel => scheduleMap.set(panel.panelId,
                            setTimeout(commonChartsJs.refreshFunction, panel.refreshIntervalMillis, panel)));
                    break;
                default:
                    console.warn("unsupported panel type");
            }
        },

        createBadge: function (panel, dataArray) {
            const badgeData = convertSumBadgeData(dataArray);
            $('#container-' + panel.panelId).text(badgeData);
            return panel;
        },

        createUpDown: function (panel, dataArray) {
            const upDown = convertSumBadgeData(dataArray);
            if (upDown == '1') {
                if (panel.title == 'Application Status') {
                    $('#container-' + panel.panelId).html('<div class="col-xs-12 box_up_s">UP</div>');
                } else {
                    $('#container-' + panel.panelId).html('<div class="col-xs-12 box_up">UP</div>');
                }
            } else {
                if (panel.title == 'Application Status') {
                    $('#container-' + panel.panelId).html('<div class="col-xs-12 box_down_s">DOWN</div>');
                } else {
                    $('#container-' + panel.panelId).html('<div class="col-xs-12 box_down">DOWN</div>');
                }
            }
            //$('#container-' + panel.panelId).text(badgeData);
            return panel;
        },

        createTable: function (panel, dataArray) {
            let data = new Map();
            for (let i = 0; i < dataArray.length; i++) {
                let item = dataArray[i];
                if (item.data.resultType === 'matrix') {
                    console.warn("unsupported result type=" + item.data.data.resultType);
                } else {
                    item.data.result.forEach(value => {
                        const key = Object.values(value.metric).toString();
                        const legend = item.legend;
                        let element = data.get(key);
                        if (element === undefined) {
                            element = {};
                            for (const [key, entry] of Object.entries(value.metric)) {
                                element[key] = entry;
                            }
                        }
                        element[legend] = parseFloat(value.value[1]).toFixed(2) - 0;
                        data.set(key, element);
                    });
                }
            }
            const tableData = convertTableData([...data.values()]);

            //어플리케이션 현황판용 렌더링 기능 분기 추가.
            if (panel.title == '보험코어 어플리케이션') {
                renderAppTable(panel, tableData);
            } else {
                renderTable(panel, tableData);
            }
            return panel;
        },

        refreshFunction: function (panel) {
            const panelType = panel.panelType;
            panel.readyTimestamp = panel.readyTimestamp + panel.refreshIntervalMillis;
            let timerId = setTimeout(commonChartsJs.refreshFunction, panel.refreshIntervalMillis, panel);
            scheduleMap.set(panel.panelId, timerId);
            switch (panelType) {
                case "CHART":
                    commonChartsJs.refreshChart(panel);
                    break;
                case "TABLE":
                    commonChartsJs.getDataByPanel(panel)
                        .then(value => commonChartsJs.createTable(panel, value));
                    break;
                case "BADGE":
                    commonChartsJs.getDataByPanel(panel)
                        .then(value => commonChartsJs.createBadge(panel, value));
                    break;
                case "UPDOWN":
                    commonChartsJs.getDataByPanel(panel)
                        .then(value => commonChartsJs.createUpDown(panel, value));
                    break;
                default:
                    console.warn("unsupported panel type");
            }
        },

        refreshChart: function (panel) {
            const chart = chartMap.get(panel.panelId);
            const chartSeries = chart.series;
            if (panel.chartQueries.length > 0) {
                this.getDataByPanel(panel, false)
                    .then(responses => this.convertSeries(panel, responses))
                    .then(series => {
                        const start = new Date().getTime();
                        switch (panel.chartType) {
                            case "sparkline":
                            case "scatter":
                            case "line":
                                const seriesMap = new Map(series.map(i => [i.name, i]));
                                for (let chartSeriesItem of chartSeries) {
                                    const seriesData = seriesMap.get(chartSeriesItem.name);
                                    if (seriesData.data.length) {
                                        seriesData.data.forEach((arr, index) => {
                                            chartSeriesItem.addPoint(arr, index === seriesData.data.length - 1, true);
                                        })
                                    }
                                    seriesMap.delete(chartSeriesItem.name);
                                }
                                if (seriesMap.size > 0) {
                                    seriesMap.forEach((value, key) => chart.addSeries(value));
                                }

                                if (panel.chartType === 'sparkline') {
                                    const latestSeries = chartSeries[chartSeries.length - 1];
                                    let lastPoint = latestSeries.points[latestSeries.points.length - 1];
                                    let lastVal = addSparkUnitFormat(lastPoint.y, panel.yaxisUnit);
                                    chart.customText.attr({
                                        //시리즈의 마지막 데이터 y 값 갱신
                                        text: lastVal
                                    })
                                }

                                break;
                            case "solidgauge":
                                if (series[0].data.lengrh) {
                                    chartSeries[0].points[0].update(series[0].data[0]);
                                }
                                break;
                            default:
                                console.warn("unsupported chart type");
                        }
                        console.log("refreshChart completed", panel.panelId, panel.title, (new Date().getTime()) - start);
                    });
            }
        },

        getDataByPanel: function (panel, isCreate) {
            return Promise.all(panel.chartQueries.map(chartQuery => {
                const convertApiQuery = commonVariablesJs.convertVariableApiQuery(chartQuery.apiQuery);

                const start = isCreate ? panel.readyTimestamp - (60 * 60) * 1000
                    : panel.readyTimestamp - panel.refreshIntervalMillis;

                const end = isCreate ? start + (60 * 60) * 1000
                    : start + panel.refreshIntervalMillis;

                if (chartQuery.apiQuery.indexOf("query_range") > 0) {
                    return request = this.getFetchRequest(convertApiQuery + this.getQueryRangeTimeNStep(chartQuery, start, end));
                } else {
                    return request = this.getFetchRequest(convertApiQuery);
                }
            }));
        },

        convertSeries: function (panel, responses) {
            const chartQueries = panel.chartQueries;
            const series = chartQueries.flatMap(function(chartQuery, index) {
                const responseElement = responses[index];
                if (responseElement.status === 'error' || !responseElement.data.result.length) {
                    return panel.chartType === 'solidgauge' ? {
                        "name": "N/A",
                        "data": [0, 0]
                    } : undefined;
                }
                chartQuery.resultType = responseElement.data.resultType;
                return responseElement.data.result.flatMap(value => {
                    return {
                        "name": Mustache.render(chartQuery.legend, value.metric),
                        "data": chartQuery.resultType === 'matrix'
                            ? value.values.map(arr => [arr[0] * 1000, parseFloat(arr[1]).toFixed(2) - 0])
                            : [parseFloat(value.value[1]).toFixed(2) - 0]
                    };
                });
            }).filter(value => value !== undefined);
            return series;
        },

        getChartData: function (panel, series) {
            const type = panel.chartType;
            let data;
            switch (type) {
                case "line":
                    data = this.getLineChartData(panel, series);
                    break;
                case "solidgauge":
                    data = this.getGaugeChartData(panel, series);
                    break;
                case "sparkline":
                    data = this.getSparkLineChartData(panel, series);
                    break;
                case "scatter":
                    data = this.getScatterChartData(panel, series);
                    break;
                default:
                    console.warn("unsupported chart type");
            }
            return data;
        },
        getLineChartData: function (panel, series) {
            return {
                chart: {
                    type: panel.chartType.toLowerCase(),
                    styledMode: false,
                    events: {
                        load: function () {
                            scheduleMap.set(panel.panelId,
                                setTimeout(commonChartsJs.refreshFunction, panel.refreshIntervalMillis, panel));
                        }
                    }
                },
                credits: {
                    enabled: false
                },
                exporting: {
                    enabled: false
                },
                yAxis: {
                    // min: parseFloat(panel.yaxisMin),
                    // max: panel.yaxisMax,
                    title: {
                        text: panel.yaxisLabel
                    },
                    labels: {
                        // format: '{value} '+ panel.yaxisUnit,
                        formatter: function () {
                            if (Math.abs(this.value) > 1000) {
                                return Highcharts.numberFormat(this.value / 1024, 0) + " K" + panel.yaxisUnit;
                            }
                            return this.value + ' ' + panel.yaxisUnit;
                        }
                    }
                },
                xAxis: {
                    type: panel.xaxisMode
                },
                title: null,
                series: series
            }
        },
        getGaugeChartData: function (panel, series) {
            series.forEach(item => {
                const valueHtml = item.name === 'N/A' ? '<span style="font-size:25px">' + item.name + '</span><br/>'
                    : '<span style="font-size:25px">{y}</span><br/>';

                item.dataLabels = {
                    format:
                        '<div style="text-align:center">' +
                        valueHtml +
                        '<span style="font-size:10px;opacity:0.4">' +
                        panel.title + ' [' + panel.yaxisUnit + ']' +
                        '</span>' +
                        '</div>'
                };
                item.tooltip = {
                    valueSuffix: ' ' + panel.yaxisUnit
                };
            })

            return {
                chart: {
                    type: panel.chartType.toLowerCase(),
                    styledMode: false,
                    events: {
                        load: function () {
                            scheduleMap.set(panel.panelId,
                                setTimeout(commonChartsJs.refreshFunction, panel.refreshIntervalMillis, panel));
                        }
                    }
                },
                title: panel.title,
                yAxis: {
                    min: parseFloat(panel.yaxisMin),
                    max: parseFloat(panel.yaxisMax),
                    title: {
                        text: panel.yaxisLabel
                    }
                },
                series: series
            }
        },
        //스파크라인 차트 --> 차트 타입은 기본형인 'area'
        getSparkLineChartData: function (panel, series) {
            return {
                chart: {
                    type: 'area',
                    styledMode: false,
                    backgroundColor: 'transparent',
                    events: {
                        load: function () {
                            const chart = this;
                            const series = this.series;
                            //현재 값을 스파크라인 판넬 중앙에 표시하고, 리프레시할때 마다 업데이트하기 위해 customText renderer 사용
                            //loadSparkLineChartData 메소드에서 customText트 변수 업데이트
                            drawOneLabel(chart, series, panel.yaxisUnit);
                            scheduleMap.set(panel.panelId,
                                setTimeout(commonChartsJs.refreshFunction, panel.refreshIntervalMillis, panel));
                        }
                    },
                    margin: [60, 0, 0, 0],
                    style: {
                        overflow: 'visible'
                    },
                    skipClone: true
                },
                title: {
                    text: panel.title,
                    style: {
                        color: '#bebebe',
                        fontWeight: 'bold'
                    }
                },
                credits: {
                    enabled: false
                },
                xAxis: {
                    labels: {
                        enabled: false
                    },
                    title: {
                        text: null
                    },
                    startOnTick: false,
                    endOnTick: false,
                    tickPositions: []
                },
                yAxis: {
                    min: 0,
                    max: 100,
                    endOnTick: false,
                    startOnTick: false,
                    labels: {
                        enabled: false
                    },
                    title: {
                        text: null
                    },
                    tickPositions: []
                },
                plotOptions: {
                    series: {
                        enableMouseTracking: false,
                        animation: false,
                        lineWidth: 0,
                        shadow: false,
                        fillColor: '#5a5c69',
                        marker: {
                            enabled: false
                        },
                        showInNavigator: true
                        //fillOpacity: 0.2
                    }
                },
                tooltip: {
                    style: {
                        display: "none",
                    }
                },
                legend: {
                    enabled: false
                },
                exporting: {
                    enabled: false
                },
                series: series
            }
        },
        //히스토그램용 차트 추가...
        getScatterChartData: function (panel, series) {
            return {
                chart: {
                    type: panel.chartType.toLowerCase(),
                    styledMode: false,
                    events: {
                        load: function () {
                            scheduleMap.set(panel.panelId,
                                setTimeout(commonChartsJs.refreshFunction, panel.refreshIntervalMillis, panel));
                        }
                    }
                },
                credits: {
                    enabled: false
                },
                exporting: {
                    enabled: false
                },
                xAxis: {
                    type: panel.xaxisMode
                },
                yAxis: {
                    title: {
                        text: panel.yaxisLabel
                    },
                },
                legend: {
                    enabled: false
                },
                plotOptions: {
                    scatter: {
                        marker: {
                            radius: 2,
                            states: {
                                hover: {
                                    enabled: true,
                                    lineColor: 'rgb(100,100,100)'
                                }
                            }
                        },
                        states: {
                            hover: {
                                marker: {
                                    enabled: false
                                }
                            }
                        },
                    }
                },
                title: null,
                series: series
            }
        },
        renderChart: function (panel, chartData) {
            const type = chartData.chart.type;
            switch (type) {
                case "line":
                    this.renderLineHighChart(panel, chartData);
                    break;
                case "solidgauge":
                    this.renderGaugeHighChart(panel, chartData);
                    break;
                case "area":
                    this.renderSparkLineHighChart(panel, chartData);
                    break;
                case "scatter":
                    this.renderScatterHighChart(panel, chartData);
                    break;
                default:
                    console.warn("unsupported chart type");
            }
        },
        renderLineHighChart: function (panel, chartData) {
            const panelId = panel.panelId;
            const chart = new Highcharts.chart('container-' + panelId, chartData);
            chartMap.set(panelId, chart);
        },
        renderGaugeHighChart: function (panel, chartData) {
            const panelId = panel.panelId;
            const chart = new Highcharts.chart('container-' + panelId, Highcharts.merge(gaugeOptions, chartData));
            chartMap.set(panelId, chart);
        },
        renderSparkLineHighChart: function (panel, chartData) {
            const panelId = panel.panelId;
            const chart = new Highcharts.chart('container-' + panelId, chartData);
            chartMap.set(panelId, chart);
        },
        //어플리케이션 현황판용 스캐터 차트 추가..
        renderScatterHighChart: function (panel, chartData) {
            const panelId = panel.panelId;
            const chart = new Highcharts.chart('container-' + panelId, chartData);
            chartMap.set(panelId, chart);
        },

        getFetchRequest: function (uri) {
            return fetch(apiHost + uri.replace(/\+/g, "%2B")).then(response => response.json());
        },

        getQueryRangeTimeNStep: function (chartQuery, start, end) {
            const queryStep = chartQuery.queryStep === undefined || chartQuery.queryStep === ''
                ? 15 : chartQuery.queryStep;
            return String.prototype.concat("&start=", start / 1000, "&end=", end / 1000, "&step=", queryStep);
        },
        getChart: function (id) {
            return chartMap.get(id);
        },
        removeChart: function (panel) {
            const id = panel.panelId;
            const scheduleId = scheduleMap.get(id);
            clearTimeout(scheduleId);
            scheduleMap.delete(id)
            if (panel.panelType === 'CHART') {
                const chart = chartMap.get(id);
                chart.destroy();
                chartMap.delete(id);
            }
        },
        resetReadyTimestamp: function () {
            readyTimestamp = new Date().getTime();
        },


    }
}());

