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

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВПолеНаходитсяТекстИзМакета(Парам01,Парам02)","ВПолеНаходитсяТекстИзМакета","Тогда в поле ""Имя поля"" находится текст из макета ""Имя макета""","Служебный","");

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

// Тогда в поле "Имя поля" находится текст из макета "Имя макета"
// @ВПолеНаходитсяТекстИзМакета(Парам01,Парам02)
//
&НаКлиенте
Процедура ВПолеНаходитсяТекстИзМакета(Парам01,Парам02) Экспорт
	
	ЗначениеПоля = Ванесса.ПолучитьЗначениеРеквизитаОткрытойФормыПоЗаголовку(Парам01, Истина);
	
	Макет = ПолучитьМакетОбработки(Парам02);
	ТекстМакета = Макет.ПолучитьТекст();
	
	Если ЗначениеПоля <> ТекстМакета Тогда
		
		ТекстИсключения = Ванесса.Локализовать("Текст сценария не соответсвует тексту эталонного сценария.");
		ВызватьИсключение ТекстИсключения;
		
	КонецЕсли;
	
КонецПроцедуры
