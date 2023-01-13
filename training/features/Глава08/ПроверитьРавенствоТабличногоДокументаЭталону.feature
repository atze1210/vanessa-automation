﻿# language: ru

@lessons

Функционал: Интерактивная справка. Как проверить равенство табличного документа эталону.

Сценарий: Как проверить равенство табличного документа эталону.

	* Привет! В этом уроке я расскажу тебе про то, как сравнить табличный документ с эталоном. Давай откроем второй экземпляр Ванессы в режиме обучения.
		И я открываю Vanessa Automation в режиме обучения

	* И загр^узим тестовый пример.
		И я устанавливаю опцию VA в режиме обучения "ПроверкаСинтаксисаВРедакторе" "Истина"
		И я загружаю фичи в VA в режиме обучения "$КаталогИнструментов$\training\features\Примеры\ПримерРавенствоТабличногоДокументаЭталону.feature"

	
	* Основной способ сравнить табличный документ с эталоном - это использовать соответствующие шаги.
	* Основным шагом для проверки является этот.
		И Я делаю подсветку текста в редакторе VA в режиме обучения с 9 по 9 строку 'Сравнение табличного документа с эталоном' подсценарий
	* В шаге два параметра.
	* Первый - это имя реквизита табличного документа, как оно задано в конфигураторе.
		И Я делаю подсветку фрагмента текста в редакторе VA в строке в режиме обучения подсценарий 9 "ИмяРеквизита" 'Имя элемента формы'
	* Второй параметр - это имя файла эталонного макета. Имя файла указывается без расширения.
		И Я делаю подсветку фрагмента текста в редакторе VA в строке в режиме обучения подсценарий 9 "ИмяМакета" 'Имя файла эталона'
	* Важный момент.
	* Первое. Файл эталона должен быть в формате mxl.
	* Второе. Файл эталона должен находиться в каталоге проекта, либо он должен находиться в каталоге рядом с текущим фича файлом.
	* Путь к каталогу проекта задаётся здесь.
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ГруппаНастройки' UI Automation	
		И Пауза 1
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'СтраницаСервисОсновные' UI Automation	
		И Пауза 1
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ГруппаСистемныеКаталоги'
		И Пауза 1
		И Я делаю подсветку элемента VA "КаталогПроекта" "Настройка \"Каталог проекта\""
		
	* Продолжим. Часто, при сравнении табличного документа с эталоном нужно исключить из сравнения часть ячеек.
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ГруппаЗапускТестов' UI Automation	
		И Пауза 1
		
	* Для этого в файле эталона достаточно указать в значении ячейки символ *. Тогда она не будет участвовать в сравнении.
	
	* Ещё бывает случай, когда надо исключить из сравнения часть значения ячейки, а не всё её значение.
	* Тогда исключаемая часть заменяется на символ звёздочки в файле эталона.
	* А в сценарии нужно использовать уже вот этот шаг.
		И Я делаю подсветку текста в редакторе VA в режиме обучения с 10 по 10 строку 'Сравнение с эталоном по шаблону' подсценарий
	* Он использует регулярные выражения при сравнении табличного документа с эталоном.
		И Я делаю подсветку текста в редакторе VA в режиме обучения с 10 по 10 строку 'Сравнение с эталоном по шаблону' подсценарий

	* Также, есть возможность сравнивать табличный документ не с файлом эталона, а с таблицей Gherkin.
	* Для этого есть соответствующие шаги.
	* Этот сравнивает табличный документ с переданной таблицей.
		И Я делаю подсветку текста в редакторе VA в режиме обучения с 15 по 17 строку 'Сравнение с таблицей Gherkin' подсценарий
	* А этот сравнивает табличный документ с переданной таблицей с возможностью сравнивать по шаблону, т.е. заменять часть значения символом звёздочки.
		И Я делаю подсветку текста в редакторе VA в режиме обучения с 19 по 21 строку 'Сравнение с таблицей Gherkin по шаблону' подсценарий

	* Эти шаги стоит использовать только в тех случаях, когда проверяемый табличный документ очень маленький.
	* Если большой макет поместить в сценарий в виде таблицы Gherkin, то сценарий перестанет быть легко читаемым.

	* На этом всё, переходи к следующему уроку интерактивной справки.


