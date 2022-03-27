package com.kuhleuski;

import java.io.Serializable;

public class ManHumanFactory implements HumanFactory, Serializable {
    @Override
    public Human createHuman() {
        return new PersonMan();
    }
}
