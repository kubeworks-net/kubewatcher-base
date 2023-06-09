package com.kubeworks.watcher.data.vo;

public enum VariableType implements AbstractEnum<String> {

    METRIC_LABEL_VALUES("metric_label_values"),
    API_LABEL_VALUES("api_label_values");

    private final String value;

    VariableType(String value) {
        this.value = value;
    }

    @Override
    public String getValue() {
        return value;
    }



}
