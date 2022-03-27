package com.kuhleuski;

import java.io.Serializable;
import java.util.*;
import java.util.stream.Stream;

public class PersonWoman implements Human, Serializable {
    private static final Random RANDOM = new Random();
    private static final List<String> WOMAN_NAMES_LIST = new ArrayList<>(Arrays.asList("Мария", "Светлана", "Ирина", "Алиса", "Кристина", "София", "Татьяна", "Екатерина", "Ольга", "Виктория", "Елена"));
    private static final List<String> WOMAN_SURNAMES_LIST = new ArrayList<>(Arrays.asList("Щербакова", "Гончар", "Якушева", "Захарченко", "Кириленко", "Макарова", "Борисенко", "Шуневич", "Павленко", "Тетерина", "Котова", "Некрасова", "Осипова"));

    private String name = randomNameGenerator();
    private String surname = randomSurNameGenerator();
    private int age = RANDOM.nextInt(16) + 15;

    @Override
    public String randomNameGenerator() {
        int randomNameIndex = RANDOM.nextInt(WOMAN_NAMES_LIST.size());
        return WOMAN_NAMES_LIST.get(randomNameIndex);
    }

    @Override
    public String randomSurNameGenerator() {
        int randomSurnameIndex = RANDOM.nextInt(WOMAN_SURNAMES_LIST.size());
        return WOMAN_SURNAMES_LIST.get(randomSurnameIndex);
    }


    public void createAndPrintBIO() {
        StringBuilder stringBuilder = new StringBuilder();
        Stream.of(WOMAN_NAMES_LIST, WOMAN_SURNAMES_LIST)
                .forEach(Collections::shuffle);
        stringBuilder.append(String.format("%s %s %s лет", name, surname, age));
        System.out.println(stringBuilder);
    }


    @Override
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    @Override
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof PersonWoman)) return false;
        PersonWoman that = (PersonWoman) o;
        return getAge() == that.getAge() && getName().equals(that.getName()) && getSurname().equals(that.getSurname());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getName(), getSurname(), getAge());
    }
}

