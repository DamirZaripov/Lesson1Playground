# Lesson1Playground

## HW: 
Нужно доделать работу, которую делали на паре. (сортировка пузырек, реализовать 3 принципа ООП на класса (инкап. наслед. полиморф.), реализовать свою структуру данных Стэк) 

Основние дз состоит из 2-х заданий: 

1. Написать свой метод trim, который будет принимать на вход строку, а на выход возвращать строку, из которой удалена входная строка Прим: "hello world" - trim(_ word: ""hello world", with: "o") -> "hell wrld" (использовать встроенный метод trim запрещается) 

2. Написать игру на ООП: 

* Классы (Unit, Маг, Рыцарь, Ассасин, Поле битвы). Первые 3 класса наследуются от класса Unit.
* У каждого из класса (кроме "Поле битвы") должны быть поля: Здоровье, Урон, Защита, Ловкость, Никнейм. 
* Каждый новый Unit инициализируется со всем набором полей (кроме, возможно, вами придуманных дополнительных)
* У каждого класса (кроме "Поле битвы")  должен быть минимум 1 метод типа attack(to enemy: ...) 
* Поле битвы содержит в себе минимум 1 метод beginBattle(with ...), который принимает N персонажей и производит симуляцию кругового боя, где учитываются все поля персонажей (например у кого брони больше, тот в каком-то процентном соотношении меньше урона получает).  В конце, метод распечатывает какие персонажи участвовали и кто победил (побеждает тот, кто выжил, победитель 1). 
*Все значения полей, правила битвы и остальное на вашу фантазию. 

## Доп баллы:
Задание на доп баллы: Вести топ 3 самых сильных бойца (с кол-вом побед/поражений) и выводить после итогов битвы. 

## PS: 
Запушить нужно 2 файла, 1 с аудиторной работой, второй с домашкой. 

## Полезные ссылки: 
https://swift.org/documentation/  
http://swiftbook.ru