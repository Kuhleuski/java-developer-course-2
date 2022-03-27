package com.kuhleuski;


import java.io.Serializable;
import java.util.*;
import java.util.stream.Stream;

public class PersonMan implements Human, Serializable {
    private static final Random RANDOM = new Random();
    private static final List<String> MAN_NAMES_LIST = new ArrayList<>(Arrays.asList("Александр", "Максим", "Владислав", "Алексей", "Генадий", "Сергей", "Михаил", "Кирилл", "Владимир", "Пётр", "Дмитрий"));
    private static final List<String> MAN_SURNAMES_LIST = new ArrayList<>(Arrays.asList("Иванов", "Смирнов", "Малышев", "Попов", "Троицкий", "Петров", "Соколов", "Лазарев", "Медведев", "Ершов", "Фомин", "Никулин", "Малинин"));

    private String name = randomNameGenerator();
    private String surname = randomSurNameGenerator();
    private int age = RANDOM.nextInt(16) + 15;

    @Override
    public String randomNameGenerator() {
        int randomNameIndex = RANDOM.nextInt(MAN_NAMES_LIST.size());
        return MAN_NAMES_LIST.get(randomNameIndex);
    }

    @Override
    public String randomSurNameGenerator() {
        int randomSurnameIndex = RANDOM.nextInt(MAN_SURNAMES_LIST.size());
        return MAN_SURNAMES_LIST.get(randomSurnameIndex);
    }

    public void createAndPrintBIO() {
        StringBuilder stringBuilder = new StringBuilder();
        Stream.of(MAN_NAMES_LIST, MAN_SURNAMES_LIST)
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
        if (!(o instanceof PersonMan)) return false;
        PersonMan personMan = (PersonMan) o;
        return getAge() == personMan.getAge() && getName().equals(personMan.getName()) && getSurname().equals(personMan.getSurname());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getName(), getSurname(), getAge());
    }
}

