﻿#language: ru

@tree

Функционал: Загрузчик видео на Youtube


Сценарий: Загрузчик видео на Youtube


	И Я запоминаю значение выражения '0' в переменную "Счетчик"
	И Я запоминаю значение выражения 'Истина' в переменную "ЭтоСборкаВидео"
	И я запоминаю строку "C:\Temp\video\FinalVideo" в переменную "КаталогВидео"
	И я запоминаю строку "C:\Temp\video\temp\VideoFilesInRightOrder.json" в переменную "ДанныеФайловВПравильномПорядке"
	И я создаю текстовый файл с файлами видео в нужном порядке Vanessa Automation "$ДанныеФайловВПравильномПорядке$" "$КаталогВидео$" "ru"
	И для каждого значения из файла Json "$ДанныеФайловВПравильномПорядке$" 
		
		Если '$ФайлОбработан$' Тогда
		Иначе

			И Я запоминаю значение выражения '$Счетчик$+1' в переменную "Счетчик"

			И я вывожу значение переменной "ПолноеИмя"
			
			И я жду картинки "СоздатьВидео" в течение 20 секунд
			Затем клик на картинку "СоздатьВидео"
			И Пауза 0.1
			Затем клик на картинку "ДобавитьВидеоКонтекстноеМеню"

			//Загрузка файла	
			И Пауза 0.1
			И я жду картинки "ВыбратьФайлы" в течение 20 секунд
			Затем клик на картинку "ВыбратьФайлы"
			И Пауза 1
			И я помещаю в буфер обмена строку '$ИмяФайлаВидео$'
			И я нажимаю сочетание клавиш "Ctrl+V"
			И Пауза 0.1
			И я нажимаю сочетание клавиш "ENTER"
			И Пауза 1
			И я жду картинки "Информация" в течение 20 секунд

			И я вращаю колесо мыши "Back"
			

			//Выбор плейлиста
			Затем клик на картинку "ВыберитеПлейлист"
			И Пауза 0.1
			Затем клик на картинку "ВведитеНазваниеПлейлиста"
			И Пауза 0.1
			И я помещаю в буфер обмена строку '$СтрокаПоискаПлейлиста$'
			И я нажимаю сочетание клавиш "Ctrl+V"
			И Пауза 0.1
			
			Затем клик на картинку "ФлажокПлейлиста"
			И Пауза 0.1
			Затем клик на картинку "ОК"
			И Пауза 0.1

			И я жду картинки "СкопироватьСсылкуВБуферОбмена" в течение 20 секунд
			Затем клик на картинку "СкопироватьСсылкуВБуферОбмена"
			И Пауза 0.1
			И я запоминаю значение буфера обмена в переменную "СсылкаНаВидео"

			// Заголовок видео
			Затем клик на картинку "ИнформацияВКружочке"
			И Пауза 0.1
			И я нажимаю сочетание клавиш "Tab"
			//И Пауза 0.1
			И я нажимаю сочетание клавиш "Tab"
			//И Пауза 0.1
			И я нажимаю сочетание клавиш "Tab"
			//И Пауза 0.1
			И я нажимаю сочетание клавиш "Tab"
			//И Пауза 0.1
			И я нажимаю сочетание клавиш "Tab"
			//И Пауза 0.1
			И я нажимаю сочетание клавиш "Tab"
			//И Пауза 0.1
			И я нажимаю сочетание клавиш "Ctrl+A"
			//И Пауза 0.1
			И я помещаю в буфер обмена строку '$ИмяУрокаСНомером$'
			И я нажимаю сочетание клавиш "Ctrl+V"
			И Пауза 0.1
			
			//Описание видео
			Если 'ЗначениеЗаполнено($Описание$)' Тогда
				И я нажимаю сочетание клавиш "Tab"
				И Пауза 0.1
				И я нажимаю сочетание клавиш "Tab"
				И Пауза 0.1
				И я помещаю в буфер обмена строку '$Описание$'
				И я нажимаю сочетание клавиш "Ctrl+V"
				И Пауза 0.1
				

			// Завершение
			Затем клик на картинку "Далее"
			И Пауза 1
			Затем клик на картинку "ВидеоНеДляДетей"
			И Пауза 1
			И я делаю 20 раз
				Если есть картинка "Далее" Тогда
					Попытка
						Затем клик на картинку "Далее"
						И Пауза 1
					Исключение	
						И Пауза 0.1

				Если есть картинка "ДоступПоСсылке" Тогда
					Тогда я прерываю цикл
				И Пауза 1
					

			И я жду картинки "ДоступПоСсылке" в течение 20 секунд
			Затем клик на картинку "ДоступПоСсылке"
			И Пауза 0.1
			Затем клик на картинку "Сохранить"
			И Пауза 1

			И я делаю 10 раз
				Если есть картинка "Закрыть" Тогда
					Затем клик на картинку "Закрыть"
					Тогда я прерываю цикл
				И Пауза 1
					
			И я записываю ссылку на видео "$СсылкаНаВидео$" по файлу "$ИмяФайлаБезРасширения$" в файл "$ДанныеФайловВПравильномПорядке$" Vanessa Automation

