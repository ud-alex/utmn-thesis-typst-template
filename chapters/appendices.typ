#import "/assets/appendix.typ": appendix

#pagebreak()
#appendix()[Миллионы скучных таблиц]

#figure(caption: "Описание таблицы")[
#table(
  columns: (1fr, 2fr, 1fr),
  fill: (x, y) => if y == 0 { luma(220) } else { white },
  stroke: 1pt ,
  
  [ID], [Имя], [Баллы],
  [1], [Анна], [95],
  [2], [Иван], [88],
  [3], [Мария], [92]
)
]

#pagebreak()

#appendix()[Куча интересных Графиков]

#figure(caption: "Какой-то график какой-то функции")[
#image("/graphics/sine_function.png")]