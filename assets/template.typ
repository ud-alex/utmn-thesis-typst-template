#import "@preview/zebraw:0.4.0": zebraw
#import "@preview/non-unlabeled:0.2.0": dont-number-unlabeled
#import "@preview/theorion:0.6.0": set-theorion-numbering, show-theorion

// В project_data main.typ передает данные из yaml-файла
#let project(project_data, body) = {
  show: zebraw // Для красивого отображения листингов кода
  show: show-theorion // Для корректного отображения теорем/лемм/доказательств
  set-theorion-numbering("1.1.1")
  
  // Параметры документа.
  // Используются только в метаданных pdf-файла
  set document(
    title: project_data.title,
    author: project_data.author,
    date: auto,
  )
  
  // Параметры страницы
  set page(
    margin: (
      left: 30mm,
      right: 15mm,
      top: 20mm,
      bottom: 20mm,
    ),
    numbering: "1",
    fill: rgb("FCFCFA"),
    paper: "a4",
  )
  
  // Параметры текста  
  set text(
    font: "Times New Roman",
    size: 14pt,
    lang: "ru",
  )
  
  // Параметры параграфв
  set par(
    leading: 1.5em,
    first-line-indent: (
      all: true,
      amount: 1.25cm,
    ),
    justify: true,
  )
  
  // Параметры заголовков
  show heading: set block(
    below: 1.5em,
    above: 2em,
  )
  
  show heading: set text(
    size: 14pt,
  )
  
  show heading: it => { align(center)[#upper(it)] }
  
  set heading(
    numbering: "1.1.",
  )
  
  show heading.where(level: 1): set heading(numbering: none)
  show heading: set text(hyphenate: false)
  show <core_chapter>: set heading(numbering: "ГЛАВА 1.")
  
  show outline.entry: upper
  
  // По умолчанию используется сквозная нумерация формул
  set math.equation(numbering: "(1)")
  
  // Эта часть обеспечивает поддержку внутриглавной нумерации (1.1, 1.2, ...)
  // и переключается на нее, если в project_data.yml выбран именно данный способ
  
  // Создаем внутриглавный счетчик, который обнуляется в начале новой главы
  let eq_numbering_intrachapter = counter("eq")
  show heading.where(level: 1): it => {
    eq_numbering_intrachapter.update(0)
    it
  }
  
  // Используем этот счетчик для внутриглавной нумерации, если
  // project_data.numbering_style == "nested"
  set math.equation(
    numbering: it => {
      eq_numbering_intrachapter.step() // Сразу прибавляем к счетчику единицу (по умолчанию он начинается с нуля)
      context {
        let chapter_number = counter(heading).get().at(0) // Получаем номер текущей главы
        let eq_number = eq_numbering_intrachapter.get().at(0)
        numbering("(1.1)", chapter_number, eq_number) // Передаем номер главы и значение счетчика нумератору
      }
    },
    // Настройка применяется только при выполнении условия в строке ниже. 
    // Иначе — дефолтный режим со сквозной нумерацией
  ) if project_data.numbering_style == "nested"
  
  // Отключает нумерацию для формул без тегов,
  // Если того требуют настройки в project_data.yml
  let numbering_style = {
    if project_data.numbering_by_default { it => it } else { dont-number-unlabeled(math.equation) }
  }
  
  show math.equation: numbering_style
  
  //  Настройка корректного отображения таблиц:
  //    - Нумерация справа над таблицей
  //    - Название посередине над таблицей
  show figure.where(
    kind: table,
  ): it => {
    align(right)[#it.caption.supplement #it.numbering]
    v(-0.5em)
    align(center)[#it.caption.body]
    it.body
  }
  
  // Переопределение нескольких символов для лучшего соответствия
  // русскоязычной типографной традиции
  show sym.lt.eq: $lt.eq.slant$
  show sym.gt.eq: $gt.eq.slant$
  
  body
}