
#let example_block = (it) => block(stroke: (left: 1pt), inset: 1em)[#it]

= Несколько типичных примеров 

== Центрированная формула без нумерации

#example_block[
```typst
$ integral_0^(2 pi) sin x dif x = 0 $
```

$ integral_0^(2 pi) sin x dif x = 0 $


В случае, если включена автоматическая нумерация всех формул (`numbering_by_default: true` в `/project_data.yaml`), то подавлять нумерацию нужно вручную:

```typst
#math.equation(block: true, numbering: none)[
$ integral_0^(2 pi) cos x^2 dif x = 0 $]
```


]



== Формулы с автоматической нумерацией

#example_block[
    
```typst
#math.equation(block: true, numbering: "(1)", supplement: none)[
    $ a^2+b^2=c^2 $] <pythagorean>

#math.equation(block: true, numbering: "(1)")[
    $ a^2+b^2 -2 a b cos gamma =c^2 $]
```

#set math.equation(supplement:none)

#math.equation(block: true, numbering: "(1)")[
    $ a^2+b^2=c^2 $] <pythagorean>

#math.equation(block: true, numbering: "(1)")[
    $ a^2+b^2 -2 a b cos gamma =c^2 $]]

Если в файле с настройками проекта `/project_data.yaml` выбрана опция `numbering_by_default: false`, то формулы без метки `<label_name>` нумероваться не будут.

== Автоматические ссылки на формулы

#example_block[
```typst  
Формула (@pythagorean) называется теоремой Пифагора
```\

Формула (@pythagorean) называется теоремой Пифагора]

== Внутритекстовые формулы

#example_block[

```typst
Известно, что любую функцию $f: RR -> RR$ можно представить в виде суммы нечетной функции $g$ и четной функции $h$, где $g(x) = (f(x) - f(-x)) / 2$, а $h$ можно расписать красивее с помощью функции `display` как $display(h(x) = (f(x) + f(-x)) / 2)$
```\

Известно, что любую функцию $f: RR -> RR$ можно представить в виде суммы нечетной функции $g$ и четной функции $h$, где $g(x) = (f(x) - f(-x)) / 2$, а $h$ можно расписать красивее с помощью функции `display` как $display(h(x) = (f(x) + f(-x)) / 2)$
]
\

== Ручная нумерация блоков (формулы, иллюстрации, главы и др.)

#example_block()[

```typst
#math.equation(block: true, 
               numbering: (..) => "(И.U.123.I)")[
               $2^2 = 2 dot 2 = 2 + 2 >= 4$]
```

#math.equation(block: true, numbering:  (..) => "(И.U.123.I)")[$2^2 = 2 dot 2 = 2 + 2 >= 4$]<ee>
]


== Таблицы

#example_block()[

```typst
#figure(caption: "Описание таблицы")[
#table(
  columns: (1fr, 2fr, 1fr),
  fill: (x, y) => if y == 0 { luma(220) } else { white },
  stroke: 1pt ,
  
  [ID], [Имя], [Баллы],
  [1], [Анна], [95],
  [2], [Иван], [88],
  [3], [Мария], [92]
)]```

#figure(caption: "Описание таблицы")[
#table(
  columns: (1fr, 2fr, 1fr),
  fill: (x, y) => if y == 0 { luma(220) } else { white },
  stroke: 1pt ,
  
  [ID], [Имя], [Баллы],
  [1], [Анна], [95],
  [2], [Иван], [88],
  [3], [Мария], [92]
)]
]

== Изображения 

#example_block[

```typst
#figure(caption: "Какой-то график какой-то функции")[
#image("/graphics/sine_function.png")]
```

#figure(caption: "Какой-то график какой-то функции")[
#image("/graphics/sine_function.png")]
]

== Листинги кода

#example_block()[
```typst
`​``python
for i in range(10):
    print(i)
``​`
```

```python
for i in range(10):
    print(i)
```]

== Сноски

#example_block[

```typst
Какой-то текст #footnote[с какой-то сноской]
```

Какой-то текст #footnote[с какой-то сноской]

]

== Теоремы и доказательства
#example_block[
```typst
#import "@preview/theorion:0.6.0": theorem, proof, show-theorem

#theorem()[Пусть $x>=y$ и $y<=x$. Тогда $x = y$] 
#proof()[Очевидно]```

#import "@preview/theorion:0.6.0": theorem, proof, show-theorem

#theorem()[Пусть $x>=y$ и $y<=x$. Тогда $x = y$] 
#proof()[Очевидно]]

Импортировать модуль `theorion` вместе с необходимыми функциями следует в каждый файл, где он применяется. 

== Библиографические ссылки

Для работы с библиографией необходимо:

+ Добавить bib-файл в корневую директорию
+ Добавить в корневую директорию csl-файл для нужного стиля. (В файле `gost_citation_styles.txt` есть ссылки)
+ Раскомментировать строку в файле `/chapter/bibliography.typ` и выбрать нужный стиль оформления.

```typst
Все неочевидные утверждения, взятые из сторонних источников, требуют указания библиографических ссылок  @commonsense
```
