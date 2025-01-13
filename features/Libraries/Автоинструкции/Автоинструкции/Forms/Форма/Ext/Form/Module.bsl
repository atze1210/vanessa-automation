﻿
///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Automation
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Automation.
Перем КонтекстСохраняемый Экспорт;

// Делает отключение модуля
&НаКлиенте
Функция ОтключениеМодуля() Экспорт

	Ванесса = Неопределено;
	Контекст = Неопределено;
	КонтекстСохраняемый = Неопределено;

КонецФункции

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;
	
	Ванесса.ДобавитьШагВМассивТестов(
		ВсеТесты, 
		"ЯДобавляюПроизвольныйТекстВАвтоинструкцию(Парам)", 
		"ЯДобавляюПроизвольныйТекстВАвтоинструкцию", 
		"И я добавляю произвольный текст в автоинструкцию " + Символы.ПС +
		" |' <a id=""header"" /> '|" + Символы.ПС +
		" |''|" + Символы.ПС +
		" |' <a id=""Chapter 1"" /> '|" + Символы.ПС +
		" |''|" + Символы.ПС +
		" |' <a id=""Chapter 2"" /> '|" + Символы.ПС +
		" |''|" + Символы.ПС +
		" |' ## Оглавление '|" + Символы.ПС +
		" |''|" + Символы.ПС +
		" |' * <a href=""#header"">Перейти к оглавлению</a> '|" + Символы.ПС +
		" |'   * <a href=""#Chapter 1"">Глава 1</a> '|" + Символы.ПС +
		" |'     * <a href=""#Chapter 2"">Глава 2</a> '|", 
		"Позволяет добавить произвольный текст в автоинструкцию без скриншота шага. 
		|Например в MD этот шаг используется для добавления оглавления, и его наполнения. В MD этот шаг не будет автонумерован.", 
		"Прочее.Автоинструкции.Текстовые инструкции.Универсальные");
	
	Ванесса.ДобавитьШагВМассивТестов(
		ВсеТесты, 
		"ЯДобавляюИзображениеВАвтоинструкцию(Парам)", 
		"ЯДобавляюИзображениеВАвтоинструкцию", 
		"И я добавляю изображение в автоинструкцию " + Символы.ПС + 
		" |'АлтернативныйТекст'|'Изображение1'|" + Символы.ПС + 
		" |'Путь'|'https://1cbn.ru/images/trading_scheme.png'|" + Символы.ПС + 
		" |'Подсказка'|'Мое изображение №1'|" + Символы.ПС + 
		" |'Ссылка'|'https://1cbn.ru'|" + Символы.ПС, 
		"Добавление изображения с гипрссылкой в автоинструкцию HTML или MD. Путь может быть задан 
		|как относительный ""../trading_scheme.png"", так и абсолютный ""https://1cbn.ru/images/trading_scheme.png"" ", 
		"Прочее.Автоинструкции.Текстовые инструкции.Универсальные");
	
	Ванесса.ДобавитьШагВМассивТестов(
		ВсеТесты,
		"ЯДобавляюРазрывСтраницыВАвтоинструкцию()",
		"ЯДобавляюРазрывСтраницыВАвтоинструкцию",
		"И я добавляю разрыв страницы в автоинструкцию",
		"Вставляет разрыв страницы в инструкции MD и HTML",
		"Прочее.Автоинструкции.Текстовые инструкции.Универсальные");
	
	Ванесса.ДобавитьШагВМассивТестов(
		ВсеТесты,
		"ЯДобавляюЗаголовокВАвтоинструкцию(ТабПарам)",
		"ЯДобавляюЗаголовокВАвтоинструкцию",
		"И я добавляю заголовок в автоинструкцию " + Символы.ПС +
		" |'Заголовок'|'Мой заголовок 2'|" + Символы.ПС +
		" |'Уровень  '|'2'|",
		"Добавляет заголовок в инструкции MD и HTML. Уровень заголовка влияет на условное офомление заголовка. 
		|Доступные значения уровня: 1; 2; 3",
		"Прочее.Автоинструкции.Текстовые инструкции.Универсальные");
	
	Ванесса.ДобавитьШагВМассивТестов(
		ВсеТесты,
		"ЯДобавляюЯкорьВАвтоинструкцию(ТабПарам)",
		"ЯДобавляюЯкорьВАвтоинструкцию",
		"И я добавляю якорь в автоинструкцию" + Символы.ПС +
		" |'header'|",
		"Добавляет якорь в автоинструкцию с указанным id якоря",
		"Прочее.Автоинструкции.Текстовые инструкции.Универсальные");
	
	Ванесса.ДобавитьШагВМассивТестов(
		ВсеТесты,
		"ЯДобавляюГиперссылкуВАвтоинструкцию(ТабПарам)",
		"ЯДобавляюГиперссылкуВАвтоинструкцию",
		"И я добавляю гиперссылку в автоинструкцию" + Символы.ПС +
		"	|'Ссылка'|'#header'|" + Символы.ПС +
		"	|'Текст'|'Оглавление'|",
		"Добавляет гиперссылку в автоинструкцию, например на ранее установленный якорь в документе (оглавление).",
		"Прочее.Автоинструкции.Текстовые инструкции.Универсальные");
	
	Ванесса.ДобавитьШагВМассивТестов(
		ВсеТесты,
		"ЯДобавляюГоризонтальнуюЛиниюВАвтоинструкцию()",
		"ЯДобавляюГоризонтальнуюЛиниюВАвтоинструкцию",
		"И я добавляю горизонтальную линию в автоинструкцию",
		"Добавляет горизонтальную линию разрыва в автоинструкцию",
		"Прочее.Автоинструкции.Текстовые инструкции.Универсальные");
	
	Ванесса.ДобавитьШагВМассивТестов(
		ВсеТесты,
		"ЯДобавляюСтилиВАвтоинструкцию(ТабПарам)",
		"ЯДобавляюСтилиВАвтоинструкцию",
		"И я добавляю стили в автоинструкцию" + Символы.ПС +
		"	|'h1{font-size: 40px; color: red} '|" + Символы.ПС +
		"	|'h2{font-size: 35px; align: center}'|" + Символы.ПС +
		"	|'p{font-size: 30px}'|",
		"Заменяет стили всего документа HTML автоинструкции. 
		|Шаг добавляется в любом месте инструкции, ограничений нет.
		|Параметр можно указать как одной строкой, так и многострочно.",
		"Прочее.Автоинструкции.Текстовые инструкции.HTML");
	
	Ванесса.ДобавитьШагВМассивТестов(
		ВсеТесты,
		"ЯДобавляюНумерованноеОглавлениеВАвтоинструкцию(ТабПарам)",
		"ЯДобавляюНумерованноеОглавлениеВАвтоинструкцию",
		"И я добавляю нумерованное оглавление в автоинструкцию" + Символы.ПС + 
			"|'ID якоря' |'Текст  '|'ID якоря родителя'|" + Символы.ПС + 
			"|'#chapter1'|'Глава 1'|'                 '|" + Символы.ПС + 
			"|'#chapter2'|'Глава 2'|'#chapter1        '|",
		"Добавляет секцию содержания с нумерацией в автоинструкцию. 
		|Если ""Вариант оформления"" выбран ""3D Карусель"" то в поле ""ID якоря"" необходимо указать индекс шага со скриншотом например ""#2"". ",
		"Прочее.Автоинструкции.Текстовые инструкции.Универсальные");
	
	Ванесса.ДобавитьШагВМассивТестов(
		ВсеТесты,
		"ЯДобавляюНеНумерованноеОглавлениеВАвтоинструкцию(ТабПарам)",
		"ЯДобавляюНеНумерованноеОглавлениеВАвтоинструкцию",
		"И я добавляю не нумерованное оглавление в автоинструкцию" + Символы.ПС + 
			"|'ID якоря' |'Текст  '|'ID якоря родителя'|" + Символы.ПС + 
			"|'#chapter1'|'Глава 1'|'                 '|" + Символы.ПС + 
			"|'#chapter2'|'Глава 2'|'#chapter1        '|",
		"Добавляет секцию содержания без нумерации в автоинструкцию. 
		|Если ""Вариант оформления"" выбран ""3D Карусель"" то в поле ""ID якоря"" необходимо указать индекс шага со скриншотом например ""#2"". ",
		"Прочее.Автоинструкции.Текстовые инструкции.Универсальные");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты, "ЯВставляюИзображениеИзФайлаВАвтоинструкцию(Парам01)", 
		"ЯВставляюИзображениеИзФайлаВАвтоинструкцию", 
		"И я вставляю изображение из файла в автоинструкцию ""КартинкаСписокСправочник1""" + Символы.ПС, 
		"Позволяет вставить изображение из файла в автоинструкцию. 
		|Поиск по имени файла производится в каталоге проекта в папке ""Файлы"".", 
		"Прочее.Автоинструкции.Вставка изображения из файла");
	
	Возврат ВсеТесты;
КонецФункции

&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции

&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Функция выполняется перед началом каждого сценария
Функция ПередНачаломСценария() Экспорт
	
КонецФункции

&НаКлиенте
// Функция выполняется перед окончанием каждого сценария
Функция ПередОкончаниемСценария() Экспорт
	
КонецФункции



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//И я добавляю произвольный текст в автоинструкцию
//@ЯДобавляюПроизвольныйТекстВАвтоинструкцию()
Функция ЯДобавляюПроизвольныйТекстВАвтоинструкцию(Парам) Экспорт
	
	Если ТипЗнч(Парам) <> Тип("Массив") Или (ТипЗнч(Парам) = Тип("Массив") И Парам.Количество()) = 0 Тогда
		
		ВызватьИсключение НСтр("ru = 'Параметр текст не заполнен'");
		
	КонецЕсли;
	
	// Запомним все переданные строки.
	МассивСтрок = Новый Массив;
	Для Каждого СтрокаПараметра Из Парам Цикл
		МассивСтрок.Добавить(СтрокаПараметра.Кол1);
	КонецЦикла;
	
	ПереданныеВШагТаблицы = ПереданныеВШагТаблицы();
	
	// СоздаватьИнструкциюMarkdown
	Если Ванесса.Объект.СоздаватьИнструкциюMarkdown Тогда
		
		Для Каждого СтрокаПараметра Из МассивСтрок Цикл
			ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, СтрокаПараметра, ТипИнструкцииMD());
		КонецЦикла;
		
	КонецЕсли;
	
	// СоздаватьИнструкциюHTML
	Если Ванесса.Объект.СоздаватьИнструкциюHTML 
			И Ванесса.Объект.ВариантСтилейHTMLИнструкции <> 3 Тогда
		
			Попытка                         
				Текст = Ванесса._СтрСоединить(МассивСтрок, Символы.ПС);
				ДокументHTML = ПолучитьДокументHTML(Текст);
			Исключение
				ДокументHTML = Новый ДокументHTML;
				УзелАбзац = ДокументHTML.СоздатьЭлемент("p");
				ДокументHTML.ЭлементДокумента.ДобавитьДочерний(УзелАбзац);
				Для Каждого СтрокаПараметров Из МассивСтрок Цикл
					УзелТекст = ДокументHTML.СоздатьТекстовыйУзел(СтрокаПараметров);
					УзелАбзац.ДобавитьДочерний(УзелТекст);
				КонецЦикла;
			КонецПопытки;
		
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, ДокументHTML, ТипИнструкцииHTML());
		
	КонецЕсли;
	
КонецФункции

&НаКлиенте
//И я добавляю изображение в автоинструкцию
//@ЯДобавляюИзображениеВАвтоинструкцию()
Функция ЯДобавляюИзображениеВАвтоинструкцию(Парам) Экспорт
	
	Если ТипЗнч(Парам) <> Тип("Массив") Или (ТипЗнч(Парам) = Тип("Массив") И Парам.Количество()) = 0 Тогда
		
		ВызватьИсключение НСтр("ru = 'Параметры не заполнен'");
		
	КонецЕсли;
	
	Параметр1 = Парам[0].Кол2; // описание без картинки
	Параметр2 = Парам[1].Кол2; // адрес нахождения картинки
	Параметр3 = Парам[2].Кол2; // текстовое описание подсказка
	Параметр4 = Парам[3].Кол2; // целевой адрес перехода
	
	ПереданныеВШагТаблицы = ПереданныеВШагТаблицы();
	
	// СоздаватьИнструкциюMarkdown
	Если Ванесса.Объект.СоздаватьИнструкциюMarkdown Тогда
		
		ШаблонСтрокиMD = "[![%1](%2 ""%3"")](%4)";
		// добавить проверки значений
		ПроизвольнаяСтрока = Ванесса._СтрШаблон(
			ШаблонСтрокиMD, 
			Параметр1, 
			Параметр2, 
			Параметр3, 
			Параметр4);
		
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, ПроизвольнаяСтрока, ТипИнструкцииMD());
		
	КонецЕсли;
	
	// СоздаватьИнструкциюHTML
	Если Ванесса.Объект.СоздаватьИнструкциюHTML 
		И Ванесса.Объект.ВариантСтилейHTMLИнструкции <> 3 Тогда
		
		ДокументHTML = Новый ДокументHTML;
		
		УзелСсылка = ДокументHTML.СоздатьЭлемент("a");
		УзелСсылка.УстановитьАтрибут("href", Параметр4);
		УзелСсылка.УстановитьАтрибут("target", "_blank");
		
		УзелКартинка = ДокументHTML.СоздатьЭлемент("Img");
		УзелКартинка.УстановитьАтрибут("src", Параметр2);
		УзелКартинка.УстановитьАтрибут("alt", Параметр1);
		УзелКартинка.УстановитьАтрибут("title", Параметр3);
		УзелСсылка.ДобавитьДочерний(УзелКартинка);
		
		ДокументHTML.ЭлементДокумента.ДобавитьДочерний(УзелСсылка);
		
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, ДокументHTML, ТипИнструкцииHTML());
		
	КонецЕсли;
	
КонецФункции

&НаКлиенте
//И я добавляю разрыв страницы в автоинструкцию
//@ЯДобавляюРазрывСтраницыВАвтоинструкцию()
Функция ЯДобавляюРазрывСтраницыВАвтоинструкцию() Экспорт
	
	ПереданныеВШагТаблицы = ПереданныеВШагТаблицы();
	
	// СоздаватьИнструкциюMarkdown
	Если Ванесса.Объект.СоздаватьИнструкциюMarkdown Тогда
		
		ЗначениеПараметра = "<div style=""page-break-after: always;""></div>";
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, ЗначениеПараметра, ТипИнструкцииMD());
		
	КонецЕсли;
	
	// СоздаватьИнструкциюHTML
	Если Ванесса.Объект.СоздаватьИнструкциюHTML 
		И Ванесса.Объект.ВариантСтилейHTMLИнструкции <> 3 Тогда
		
		ДокументHTML = Новый ДокументHTML;
		
		НовыйУзел = ДокументHTML.СоздатьЭлемент("div");
		НовыйУзел.УстановитьАтрибут("style", "page-break-after: always");
		
		ДокументHTML.ЭлементДокумента.ДобавитьДочерний(НовыйУзел);
		
		ЗначениеПараметра = ДокументHTML;
		
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, ЗначениеПараметра, ТипИнструкцииHTML());
		
	КонецЕсли;
	
КонецФункции

&НаКлиенте
//И я добавляю заголовок в автоинструкцию
//@ЯДобавляюЗаголовокВАвтоинструкцию(ТабПарам)
Функция ЯДобавляюЗаголовокВАвтоинструкцию(ТабПарам) Экспорт
	
	Если ТипЗнч(ТабПарам) <> Тип("Массив") Или (ТипЗнч(ТабПарам) = Тип("Массив") И ТабПарам.Количество() = 0) Тогда
		
		ВызватьИсключение НСтр("ru = 'Параметры не заполнены'");
		
	КонецЕсли;
	
	ПараметрЗаголовок = ТабПарам[0].Кол2;
	Если ПустаяСтрока(ПараметрЗаголовок) Тогда
		
		ВызватьИсключение НСтр("ru = 'Параметр ""Заголовок"" не заполнен'");
		
	КонецЕсли;
	
	ПараметрУровень = Число(ТабПарам[1].Кол2);
	Если ПараметрУровень < 1 Или ПараметрУровень > 3 Тогда
		
		ВызватьИсключение НСтр("ru = 'Параметр ""Уровень"" не заполнен'");
		
	КонецЕсли;
	
	ПереданныеВШагТаблицы = ПереданныеВШагТаблицы();
	
	// СоздаватьИнструкциюMarkdown
	Если Ванесса.Объект.СоздаватьИнструкциюMarkdown Тогда
		
		ШаблонСтрокиMD = "%1 %2";
		УровеньЗаголовка = "";
		Для Уровень = 1 По ПараметрУровень Цикл
			УровеньЗаголовка = УровеньЗаголовка + "#";
		КонецЦикла;
		ЗаголовокАвтоинструкции = Ванесса._СтрШаблон(ШаблонСтрокиMD, УровеньЗаголовка, ПараметрЗаголовок);
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, ЗаголовокАвтоинструкции, ТипИнструкцииMD());
		
	КонецЕсли;
	
	// СоздаватьИнструкциюHTML
	Если Ванесса.Объект.СоздаватьИнструкциюHTML 
		И Ванесса.Объект.ВариантСтилейHTMLИнструкции <> 3 Тогда
		
		ШаблонИмяЭлемента = "h%1";
		ИмяЭлемента = Ванесса._СтрШаблон(ШаблонИмяЭлемента, ПараметрУровень);
		
		ДокументHTML = Новый ДокументHTML;
		
		НовыйУзел = ДокументHTML.СоздатьЭлемент(ИмяЭлемента);
		НовыйУзел.ТекстовоеСодержимое = ПараметрЗаголовок;
		
		ДокументHTML.ЭлементДокумента.ДобавитьДочерний(НовыйУзел);
		
		ЗаголовокАвтоинструкции = ДокументHTML;
		
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, ЗаголовокАвтоинструкции, ТипИнструкцииHTML());
		
	КонецЕсли;
	
КонецФункции

&НаКлиенте
//И я добавляю якорь в автоинструкцию
//@ЯДобавляюЯкорьВАвтоинструкцию(ТабПарам)
Функция ЯДобавляюЯкорьВАвтоинструкцию(ТабПарам) Экспорт
	
	Если ТипЗнч(ТабПарам) <> Тип("Массив") 
		Или (ТипЗнч(ТабПарам) = Тип("Массив") И ТабПарам.Количество() = 0) 
		Или (ТипЗнч(ТабПарам) = Тип("Массив") И ПустаяСтрока(ТабПарам[0])) Тогда
		
		ВызватьИсключение НСтр("ru = 'Параметр не заполнен'");
		
	КонецЕсли;
	
	ПараметрIDЯкоря = ТабПарам[0].Кол1;
	ПереданныеВШагТаблицы = ПереданныеВШагТаблицы();
	
	// СоздаватьИнструкциюMarkdown
	Если Ванесса.Объект.СоздаватьИнструкциюMarkdown Тогда
		
		ШаблонПараметра = "<a id=""%1"" />";
		ЗначениеПараметра = Ванесса._СтрШаблон(ШаблонПараметра, ПараметрIDЯкоря);
		
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, ЗначениеПараметра, ТипИнструкцииMD());
		
	КонецЕсли;
	
	// СоздаватьИнструкциюHTML
	Если Ванесса.Объект.СоздаватьИнструкциюHTML 
		И Ванесса.Объект.ВариантСтилейHTMLИнструкции <> 3 Тогда
		
		ДокументHTML = Новый ДокументHTML;
		
		НовыйУзел = ДокументHTML.СоздатьЭлемент("a");
		НовыйУзел.УстановитьАтрибут("id", ПараметрIDЯкоря);
		
		ДокументHTML.ЭлементДокумента.ДобавитьДочерний(НовыйУзел);
		
		ЗначениеПараметра = ДокументHTML;
		
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, ЗначениеПараметра, ТипИнструкцииHTML());
		
	КонецЕсли;
	
КонецФункции

&НаКлиенте
//И я добавляю гиперссылку в автоинструкцию
//@ЯДобавляюГиперссылкуВАвтоинструкцию(ТабПарам)
Функция ЯДобавляюГиперссылкуВАвтоинструкцию(ТабПарам) Экспорт
	
	Если ТипЗнч(ТабПарам) <> Тип("Массив") 
		Или (ТипЗнч(ТабПарам) = Тип("Массив") И ТабПарам.Количество() = 0) Тогда
		
		ВызватьИсключение НСтр("ru = 'Параметры не заполнены'");
		
	КонецЕсли;
	
	ПараметрСсылка = ТабПарам[0].Кол2;
	ПараметрТекст = ТабПарам[1].Кол2;
	ПереданныеВШагТаблицы = ПереданныеВШагТаблицы();
	
	// СоздаватьИнструкциюMarkdown
	Если Ванесса.Объект.СоздаватьИнструкциюMarkdown Тогда
		
		ШаблонПараметра = "<a href=""%1"">%2</a>";
		ЗначениеПараметра = Ванесса._СтрШаблон(ШаблонПараметра, ПараметрСсылка, ПараметрТекст);
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, ЗначениеПараметра, ТипИнструкцииMD());
		
	КонецЕсли;
	
	// СоздаватьИнструкциюHTML
	Если Ванесса.Объект.СоздаватьИнструкциюHTML 
		И Ванесса.Объект.ВариантСтилейHTMLИнструкции <> 3 Тогда
		
		ДокументHTML = Новый ДокументHTML;
		
		УзелDiv = ДокументHTML.СоздатьЭлемент("div");
		ДокументHTML.ЭлементДокумента.ДобавитьДочерний(УзелDiv);
		
		ЗначениеСтиля = "margin-bottom: 10px; color:#1068bf; padding-bottom: 2px;";
		
		НовыйУзел = ДокументHTML.СоздатьЭлемент("a");
		НовыйУзел.УстановитьАтрибут("style", ЗначениеСтиля);
		НовыйУзел.УстановитьАтрибут("href", ПараметрСсылка);
		
		НовыйУзел.ТекстовоеСодержимое = ПараметрТекст;
		
		УзелDiv.ДобавитьДочерний(НовыйУзел);
		
		ДокументHTML.ЭлементДокумента.ДобавитьДочерний(УзелDiv);
		
		ЗначениеПараметра = ДокументHTML;
		
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, ЗначениеПараметра, ТипИнструкцииHTML());
		
	КонецЕсли;
	
КонецФункции

&НаКлиенте
//И я добавляю горизонтальную линию в автоинструкцию
//@ЯДобавляюГоризонтальнуюЛиниюВАвтоинструкцию()
Функция ЯДобавляюГоризонтальнуюЛиниюВАвтоинструкцию() Экспорт
	
	ПереданныеВШагТаблицы = ПереданныеВШагТаблицы();
	
	// СоздаватьИнструкциюMarkdown
	Если Ванесса.Объект.СоздаватьИнструкциюMarkdown Тогда
		
		ЗначениеПараметра = "***";
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, ЗначениеПараметра, ТипИнструкцииMD());
		
	КонецЕсли;
	
	// СоздаватьИнструкциюHTML
	Если Ванесса.Объект.СоздаватьИнструкциюHTML 
		И Ванесса.Объект.ВариантСтилейHTMLИнструкции <> 3 Тогда
		
		ДокументHTML = Новый ДокументHTML;
		ЗначениеСтиля = "border-bottom: medium solid; margin: 20px 0px";
		
		УзелБлок = ДокументHTML.СоздатьЭлемент("div");
		УзелБлок.УстановитьАтрибут("style", ЗначениеСтиля);
		
		ДокументHTML.ЭлементДокумента.ДобавитьДочерний(УзелБлок);
		
		ЗначениеПараметра = ДокументHTML;
		
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, ЗначениеПараметра, ТипИнструкцииHTML());
		
	КонецЕсли;
	
КонецФункции

&НаКлиенте
//И я добавляю стили в автоинструкцию
//@ЯДобавляюСтилиВАвтоинструкцию(ТабПарам)
Функция ЯДобавляюСтилиВАвтоинструкцию(ТабПарам) Экспорт
	
	Если ТипЗнч(ТабПарам) <> Тип("Массив") 
		Или (ТипЗнч(ТабПарам) = Тип("Массив") И ТабПарам.Количество() = 0) Тогда
		
		ВызватьИсключение НСтр("ru = 'Параметры не заполнены'");
		
	КонецЕсли;
	
	// Копируем параметры, что бы их не очистить.
	ТаблицаПараметров = Новый Массив;
	Для Каждого СтрокаПараметра Из ТабПарам Цикл
		ТаблицаПараметров.Добавить(СтрокаПараметра);
	КонецЦикла;
	
	ПереданныеВШагТаблицы = ПереданныеВШагТаблицы();
	
	// СоздаватьИнструкциюHTML
	Если Ванесса.Объект.СоздаватьИнструкциюHTML 
		И Ванесса.Объект.ВариантСтилейHTMLИнструкции <> 3 Тогда
		
		ДокументHTML = Новый ДокументHTML;
		УзелHEAD = ДокументHTML.СоздатьЭлемент("head");
		
		УзелSTYLE = ДокументHTML.СоздатьЭлемент("style");
		УзелSTYLE.УстановитьАтрибут("type", "text/css");
		
		ТекстовоеСодержимое = "";
		ШаблонСтрокиСтилей = "%1 %2";
		Для Каждого Параметр Из ТаблицаПараметров Цикл
			ТекстовоеСодержимое = Ванесса._СтрШаблон(ШаблонСтрокиСтилей, ТекстовоеСодержимое, Параметр.Кол1);
		КонецЦикла;
		УзелSTYLE.ТекстовоеСодержимое = ТекстовоеСодержимое;
		
		УзелHEAD.ДобавитьДочерний(УзелSTYLE);
		ДокументHTML.ДобавитьДочерний(УзелHEAD);
		
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, ДокументHTML, ТипИнструкцииHTML());
		
	КонецЕсли;
	
КонецФункции

&НаКлиенте
//И я добавляю нумерованное оглавление в автоинструкцию
//@ЯДобавляюНумерованноеОглавлениеВАвтоинструкцию(ТабПарам)
Функция ЯДобавляюНумерованноеОглавлениеВАвтоинструкцию(ТабПарам) Экспорт
	
	Если ТипЗнч(ТабПарам) <> Тип("Массив") 
		Или (ТипЗнч(ТабПарам) = Тип("Массив") И ТабПарам.Количество() <= 1 ) Тогда
		
		ВызватьИсключение НСтр("ru = 'Параметры не заполнены'");
		
	КонецЕсли;
	
	// Копируем параметры, что бы их не очистить.
	ТаблицаПараметров = Новый Массив;
	Для Каждого СтрокаПараметра Из ТабПарам Цикл
		ТаблицаПараметров.Добавить(СтрокаПараметра);
	КонецЦикла;
	
	ПереданныеВШагТаблицы = ПереданныеВШагТаблицы();
	
	// СоздаватьИнструкциюMarkdown
	Если Ванесса.Объект.СоздаватьИнструкциюMarkdown Тогда
		
		Оглавление = "
			| ## Оглавление
			|
			|***
			|
			|";
		
		ШаблонСтроки = "%1 %2. <a href=""%3"">%4</a>";
		
		НомерГлавы = 1;
		НомерПодГлавы = 1;
		// Начинаем с 1 т.к. первая строка это заголовки.
		Для Индекс = 1 По ТаблицаПараметров.ВГраница() Цикл
			
			СтрокаПараметров = ТаблицаПараметров[Индекс];
			
			ПараметрID = СокрЛП(СтрокаПараметров.Кол1);
			ПараметрТекст = СокрЛП(СтрокаПараметров.Кол2);
			ПараметрРодитель = СокрЛП(СтрокаПараметров.Кол3);
			
			Если Не ПустаяСтрока(ПараметрРодитель) Тогда
				// Подставляем "1" т.к. вложенные списки в MD сами нумеруются.
				СтрокаОглавления = Ванесса._СтрШаблон(ШаблонСтроки, "    ", НомерПодГлавы, ПараметрID, ПараметрТекст);
				НомерПодГлавы = НомерПодГлавы + 1;
			Иначе
				СтрокаОглавления = Ванесса._СтрШаблон(ШаблонСтроки, "", НомерГлавы, ПараметрID, ПараметрТекст);
				НомерГлавы = НомерГлавы + 1;
				НомерПодГлавы = 1;
			КонецЕсли;
			
			Оглавление = Оглавление + Символы.ПС + СтрокаОглавления;
			
		КонецЦикла;
		
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, Оглавление, ТипИнструкцииMD());
		
	КонецЕсли;
	
	// СоздаватьИнструкциюHTML
	Если Ванесса.Объект.СоздаватьИнструкциюHTML Тогда
		
		ЗначениеПараметра = "";
		СоздатьОглавление(ТаблицаПараметров, Истина, ЗначениеПараметра);
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, ЗначениеПараметра, ТипИнструкцииHTML());
		
	КонецЕсли;
	
КонецФункции

&НаКлиенте
//И я добавляю не нумерованное оглавление в автоинструкцию
//@ЯДобавляюНеНумерованноеОглавлениеВАвтоинструкцию(ТабПарам)
Функция ЯДобавляюНеНумерованноеОглавлениеВАвтоинструкцию(ТабПарам) Экспорт
	
	Если ТипЗнч(ТабПарам) <> Тип("Массив") 
		Или (ТипЗнч(ТабПарам) = Тип("Массив") И ТабПарам.Количество() <= 1 ) Тогда
		
		ВызватьИсключение НСтр("ru = 'Параметры не заполнены'");
		
	КонецЕсли;
	
	// Копируем параметры, что бы их не очистить.
	ТаблицаПараметров = Новый Массив;
	Для Каждого СтрокаПараметра Из ТабПарам Цикл
		ТаблицаПараметров.Добавить(СтрокаПараметра);
	КонецЦикла;
	
	ПереданныеВШагТаблицы = ПереданныеВШагТаблицы();
	
	// СоздаватьИнструкциюMarkdown
	Если Ванесса.Объект.СоздаватьИнструкциюMarkdown Тогда
		
		Оглавление = "
			| ## Оглавление
			|
			|***
			|
			|";
		
		ШаблонСтроки = "%1 * <a href=""%2"">%3</a>";
		
		// Начинаем с 1 т.к. первая строка это заголовки.
		Для Индекс = 1 По ТаблицаПараметров.ВГраница() Цикл
			
			СтрокаПараметров = ТаблицаПараметров[Индекс];
			
			ПараметрID = СокрЛП(СтрокаПараметров.Кол1);
			ПараметрТекст = СокрЛП(СтрокаПараметров.Кол2);
			ПараметрРодитель = СокрЛП(СтрокаПараметров.Кол3);
			
			Если Не ПустаяСтрока(ПараметрРодитель) Тогда
				СтрокаОглавления = Ванесса._СтрШаблон(ШаблонСтроки, "    ", ПараметрID, ПараметрТекст);
			Иначе
				СтрокаОглавления = Ванесса._СтрШаблон(ШаблонСтроки, "", ПараметрID, ПараметрТекст);
			КонецЕсли;
			
			Оглавление = Оглавление + Символы.ПС + СтрокаОглавления;
			
		КонецЦикла;
		
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, Оглавление, ТипИнструкцииMD());
		
	КонецЕсли;
	
	// СоздаватьИнструкциюHTML
	Если Ванесса.Объект.СоздаватьИнструкциюHTML 
		И Ванесса.Объект.ВариантСтилейHTMLИнструкции <> 3 Тогда
		
		ЗначениеПараметра = "";
		СоздатьОглавление(ТаблицаПараметров, Ложь, ЗначениеПараметра);
		ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, ЗначениеПараметра, ТипИнструкцииHTML());
		
	КонецЕсли;
	
КонецФункции

//И я вставляю изображение из файла в автоинструкцию
//@ЯВставляюИзображениеИзФайлаВАвтоинструкцию()
Функция ЯВставляюИзображениеИзФайлаВАвтоинструкцию(Парам01) Экспорт
	
	Если ТипЗнч(Парам01) <> Тип("Строка") ИЛИ ПустаяСтрока(Парам01) Тогда
		
		ВызватьИсключение НСтр("ru = 'Параметр имя файла не заполнен'");
		
	КонецЕсли
	
КонецФункции

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Функция ПереданныеВШагТаблицы()
	
	ТекущийШаг = Ванесса.ПолучитьСтруктуруТекущегоШагаИзМассивСценариевДляВыполнения();
	Если ТекущийШаг.Свойство("ПереданныеВШагТаблицы") Тогда
		
		ПереданныеВШагТаблицы = ТекущийШаг.ПереданныеВШагТаблицы;
		ПереданныеВШагТаблицы[0].Очистить();
		
	Иначе
		
		ПереданныеВШагТаблицы = Новый Массив;
		ПереданныеВШагТаблицы.Добавить(Новый Массив);
		ТекущийШаг.Вставить("ПереданныеВШагТаблицы", ПереданныеВШагТаблицы);
		
	КонецЕсли;
	
	Возврат ПереданныеВШагТаблицы;
	
КонецФункции

&НаКлиенте
Процедура ЗаполнитьПереданныеВШагТаблицы(ПереданныеВШагТаблицы, Параметр, ТипИнструкции = "")
	
	Если ПустаяСтрока(ТипИнструкции) Тогда
		ВызватьИсключение НСтр("ru = 'Не указан тип инструкции!'");
	КонецЕсли;
	
	ПараметрыШага = Новый Соответствие;
	ПараметрыШага.Вставить(ТипИнструкции, Параметр);
	ПереданныеВШагТаблицы[0].Добавить(ПараметрыШага);
	
КонецПроцедуры

&НаКлиенте
Процедура СоздатьОглавление(ТабПарам, НумерованныйСписок, ЗначениеПараметра)
	
	ДокументHTML = Новый ДокументHTML;
	
	УзелСекция = ДокументHTML.СоздатьЭлемент("nav");
	УзелСекция.УстановитьАтрибут("class", "toc-wrapper");
	
	Если НумерованныйСписок Тогда
		УзелСписокСодержания = ДокументHTML.СоздатьЭлемент("ol");
		УзелСписокСодержания.УстановитьАтрибут("class", "toc_ol");
	Иначе
		УзелСписокСодержания = ДокументHTML.СоздатьЭлемент("ul");
		УзелСписокСодержания.УстановитьАтрибут("class", "toc_ul");
	КонецЕсли;   
	СписокСодержания = ДокументHTML.СоздатьЭлемент("p");
	СписокСодержания.УстановитьАтрибут("class", "toc_header");
	СписокСодержания.ТекстовоеСодержимое = НСтр("en = 'Content'; ru = 'Содержание'");
	УзелСписокСодержания.ДобавитьДочерний(СписокСодержания); 
	// Начинаем с 1 т.к. первая строка это заголовки.
	Для Индекс = 1 По ТабПарам.ВГраница() Цикл
		
		СтрокаОглавления = ТабПарам[Индекс];
		
		ПараметрID = СокрЛП(СтрокаОглавления.Кол1);
		ПараметрТекст = СокрЛП(СтрокаОглавления.Кол2);
		ПараметрРодитель = СокрЛП(СтрокаОглавления.Кол3);
		IDЭлемента = Сред(ПараметрID, 2, СтрДлина(ПараметрID));
		IDРодителя = Ванесса._СтрШаблон("li_%1", Сред(ПараметрРодитель, 2, СтрДлина(ПараметрРодитель)));
		УзелРодитель = Неопределено;
		
		Если Не ПустаяСтрока(IDРодителя) Тогда
			УзелРодитель = ДокументHTML.ПолучитьЭлементПоИдентификатору(IDРодителя);
			Если УзелРодитель <> Неопределено Тогда
				УзелВложенныйСписок = Неопределено;
				Для Каждого ДочернийУзел Из УзелРодитель.ДочерниеУзлы Цикл
					Если ДочернийУзел.ИмяУзла = "ol" Или ДочернийУзел.ИмяУзла = "ul" Тогда
						УзелВложенныйСписок = ДочернийУзел;
						Прервать;
					КонецЕсли;
				КонецЦикла;
				Если УзелВложенныйСписок = Неопределено Тогда
					Если НумерованныйСписок Тогда
						УзелВложенныйСписок = ДокументHTML.СоздатьЭлемент("ol");
					Иначе
						УзелВложенныйСписок = ДокументHTML.СоздатьЭлемент("ul");
					КонецЕсли;
				КонецЕсли;
			КонецЕсли;
		КонецЕсли;
		
		IDЭлементаLI = Ванесса._СтрШаблон("li_%1", IDЭлемента);
		УзелЭлементСодержания = ДокументHTML.СоздатьЭлемент("li");
		УзелЭлементСодержания.УстановитьАтрибут("id", IDЭлементаLI);
		УзелЭлементСодержания.УстановитьАтрибутИдентификатор("id", Истина);
		
		Если Не НумерованныйСписок Тогда
			УзелЭлементСодержания.УстановитьАтрибут("content", "");
		КонецЕсли;
		
		УзелСсылка = ДокументHTML.СоздатьЭлемент("a");
		УзелСсылка.УстановитьАтрибут("href", ПараметрID);
		Если Ванесса.Объект.ВариантСтилейHTMLИнструкции = 3 Тогда
			УзелСсылка.УстановитьАтрибут("id", IDЭлемента);
			УзелСсылка.УстановитьАтрибутИдентификатор("id", Истина);
		КонецЕсли;
		УзелСсылка.ТекстовоеСодержимое = ПараметрТекст;
		
		УзелЭлементСодержания.ДобавитьДочерний(УзелСсылка);
		
		Если УзелРодитель <> Неопределено И УзелВложенныйСписок <> Неопределено Тогда
			УзелВложенныйСписок.ДобавитьДочерний(УзелЭлементСодержания);
			УзелРодитель.ДобавитьДочерний(УзелВложенныйСписок);
		Иначе
			УзелСписокСодержания.ДобавитьДочерний(УзелЭлементСодержания);
		КонецЕсли;
		
	КонецЦикла;
	
	УзелСекция.ДобавитьДочерний(УзелСписокСодержания);
	
	ДокументHTML.ЭлементДокумента.ДобавитьДочерний(УзелСекция);
	
	ЗначениеПараметра = ДокументHTML;
	
КонецПроцедуры

Функция ТипИнструкцииMD()
	Возврат "MD";
КонецФункции

Функция ТипИнструкцииHTML()
	Возврат "HTML";
КонецФункции

&НаКлиенте
Функция ПолучитьДокументHTML(СтрокаHTML)
	ЧтениеHTML = Новый ЧтениеHTML;
	ЧтениеHTML.УстановитьСтроку(СтрокаHTML);
	ПостроительDOM = Новый ПостроительDOM;
	ДокументHTML = ПостроительDOM.Прочитать(ЧтениеHTML);
	ЧтениеHTML.Закрыть();
	Возврат ДокументHTML;
КонецФункции

#КонецОбласти