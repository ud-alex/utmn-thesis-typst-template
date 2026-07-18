
#import "/assets/template.typ": project
#show: project.with(yaml("/project_data.yml"))


#include "chapters/title_page.typ"

#outline(title: "Содержание", indent: 1.5em)

#pagebreak()


// #include "assets/demo.typ"

#include "chapters/intro.typ"

#include "chapters/first_chapter.typ"

#include "chapters/second_chapter.typ"

#include "chapters/conclusion.typ"

#include "chapters/bibliography.typ"


#include "chapters/appendices.typ"



