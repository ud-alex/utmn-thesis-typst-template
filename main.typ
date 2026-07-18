
#import "/assets/template.typ": project
#show: project.with(yaml("/project_data.yml"))


#include "chapters/title_page.typ"

#outline(title: "Содержание", indent: 1.5em)

//#pagebreak()


// #include "assets/demo.typ"

// Проверка корректности разреженности текста (интерлиньяжа)
// Пока не найду лучшее решение — чисто экспериментально
#[
  #pagebreak()
  #set par.line(numbering: "1", numbering-scope: "page")
  #lorem(350)]

#include "chapters/intro.typ"

#include "chapters/first_chapter.typ"

#include "chapters/second_chapter.typ"

#include "chapters/conclusion.typ"

#include "chapters/bibliography.typ"


#include "chapters/appendices.typ"



