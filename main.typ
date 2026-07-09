
#import "template.typ": project
#show: project.with(yaml("project_data.yaml"))


#include "chapters/title_page.typ"

#outline(title: "Содержание", indent: 1.5em)

#pagebreak()


#include "demo.typ"

#include "chapters/intro.typ"

#include "chapters/first_chapter.typ"

#include "chapters/second_chapter.typ"

#include "chapters/conclusion.typ"

#include "chapters/bibliography.typ"


#include "chapters/appendices.typ"



