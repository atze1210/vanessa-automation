# language: ru
# encoding: utf-8
#parent ua:
@UA40_проверять_формирование_видеоинструкций
#parent uf:
@UF6_текстовые_и_видео_инструкции


@tree
@IgnoreOnCIMainBuild


Функционал: 	 Тестовая фича, проверяющая генерацию видео
Как 	 Разработчик
Я 	 хочу 	 проверить работу генерации видео файла
Чтобы 	 я 		 	мог использовать видео автодокументирование
 
Контекст: 
	Дано я выполняю простой шаг контекста
	И я выполняю код встроенного языка
    | 'ОчиститьСообщения()' |

Сценарий: Выполнение первого 	  простого сценария
	Это верхний уровень дерева
		Это второй уровень дерева
			Когда я выполняю простой шаг
		И видеовставка "Текст обратите 		 внимание Начало"
		
		#[autodoc.text] В интерфейсе я выбираю \[ %1 \] [ТекущаяДата()] текст1 ["" + 1 + 2] текст2
		И видеовставка "Текст видеовставка Окончание"
	
	#[autodoc.ignorestep]
	И я выполняю ещё простой шаг c параметром 1
	
	#[autodoc.ignorestep]
	*Группа, которая не попадёт в видео
		И я выполняю ещё простой шаг c параметром 2
		И я выполняю ещё простой шаг c параметром 3

	И я выполняю ещё простой шаг c параметром 4
	И текст субтитров "Текст субтитров"

