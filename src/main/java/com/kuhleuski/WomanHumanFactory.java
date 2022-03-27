package com.kuhleuski;

import java.io.Serializable;

public class WomanHumanFactory implements HumanFactory, Serializable {
    @Override
    public Human createHuman() {
        return new PersonWoman();
    }
}
