package com.kuhleuski;

import java.io.*;
import java.util.*;
import java.util.stream.Stream;

public class Main {
    public static void main(String[] args) {

        // Генерирую список из 100 человек

        HumanFactory humanFactory;
        List<Human> listPersons = new ArrayList<>();
        for (int i = 0; i < 100; i++) {
            humanFactory = createHumanByGender(randomCreateHymanType());
            listPersons.add(humanFactory.createHuman());
        }

        // Удаляю дубликаты если они есть

        for (int i = 0; i < listPersons.size() - 1; i++) {
            for (int j = listPersons.size() - 1; j > i; j--) {
                if (listPersons.get(j).equals(listPersons.get(i))) {
                    listPersons.remove(j);
                }
            }
        }

        // Сортирую сначала по Фамилии, затем по имени.

        Comparator<Human> humanComparator = new HumanSurnameComparator().thenComparing(new HumanNameComparator());
        listPersons.sort(humanComparator);

        // Создаю новый список и кладу туда, отсортированных людей которым меньше 21 года
        // Распечатываю его на экран

        System.out.println("Список людей, меньше 21 года, отсортированные по фамилии, затем по имени:");
        ArrayList<Human> listPersonsLess21 = new ArrayList<>();
        for (Human x : listPersons) {
            if (x.getAge() < 21) {
                listPersonsLess21.add(x);
                System.out.println(x.getSurname() + " " + x.getName() + " " + x.getAge() + " лет");
            }
        }

        System.out.println("\n");
        System.out.println("ПРОЦЕСС ЗАПИСИ СПИСКА В ФАЙЛ");

        String filename = "personsLess21.bin";
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(filename))) {
            oos.writeObject(listPersonsLess21);
            System.out.println("Заись в файл прошла успешно");
        } catch (Exception ex) {

            System.out.println(ex.getMessage());
        }
        System.out.println("\n");

        // Десериализация. Создаю новый список куда положу прочитанный список из ФАЙЛА

        System.out.println("Список людей прочитанных из файла: ");

        ArrayList<Human> newPeople = new ArrayList<>();
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(filename))) {

            newPeople = ((ArrayList<Human>) ois.readObject());
        } catch (Exception ex) {

            System.out.println(ex.getMessage());
        }

        // вывожу на экран десериализованный список объектов через stream API
        
        Stream<Human> stream = newPeople.stream();
        stream.forEach(x -> System.out.println(x.getSurname() + " " + x.getName()));

    }

    static int randomCreateHymanType() {
        Random random = new Random();
        return random.nextInt(2) + 1;
    }

    static HumanFactory createHumanByGender(int gender) {
        if (gender == 1) {
            return new ManHumanFactory();
        } else if (gender == 2) {
            return new WomanHumanFactory();
        } else {
            throw new RuntimeException();
        }
    }
}
