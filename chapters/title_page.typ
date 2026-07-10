
#show <title_page>: set par(
  leading: 0.75em,
  first-line-indent: 
    (amount: 0cm),
  justify: false
)

#let project_data = yaml("/project_data.yaml")

#let gendered_done = if project_data.gender == "male" {"Выполнил"} else if project_data.gender == "female" {"Выполнила"}
#let gendered_student = if project_data.gender == "male" {"студент"} else if project_data.gender == "female" {"студентка"}

#let ed_level = project_data.education_level
#let thesis_type = if ed_level == "бакалавр" {"бакалаврская работа"} else if ed_level == "специалист" {"дипломная работа"} else if ed_level == "магистр" {"магистерская диссертация"}

#page(
  numbering: none, 
  margin: (bottom: 40mm),
  footer: align(center)[
    
    #par(leading: 1em)[#project_data.city \ #project_data.year год]
    ])[
      
#show heading: set text(hyphenate: false)

  
#align(center)[

  МИНИСТЕРСТВО НАУКИ И ВЫСШЕГО ОБРАЗОВАНИЯ \ РОССИЙСКОЙ ФЕДЕРАЦИИ

  Федеральное государственное автономное образовательное учреждение
  высшего образования

  #upper(project_data.university)  \
  #hide([empty line]) \
  #upper(project_data.institute) \
  #project_data.department
]

#v(1em)

#align(right)[#block(width: 52%)[

  #align(left)[
  РЕКОМЕНДОВАНО К ЗАЩИТЕ В ГЭК \
  Заведующий кафедрой \
  #project_data.department_head_credentials

  #box(line(length: 3.5cm, stroke: 0.8pt)) #project_data.department_head
  #box(line(length: 3.5cm, stroke: 0.8pt)) #project_data.year г.
  ]

]

#v(1em)

#align(center)[

  *ВЫПУСКНАЯ КВАЛИФИКАЦИОННАЯ РАБОТА*\
  #thesis_type

  #v(1em)

  #upper(project_data.title)

  #v(0.5em)

  #project_data.major_code #project_data.major \
  Профиль «#project_data.submajor»

  #v(1em)

  // #show <title_page_table>:


  #table(
    columns: (1fr,0.4fr,1fr), 
    inset: (y:5pt),
    stroke: 0pt, align: left+horizon)[
      #gendered_done работу \
      #gendered_student #project_data.academic_year курса \
      #project_data.education_mode формы обучения][][#project_data.author][
      ][][
      ][Научный руководитель \
      #project_data.advisor_credentials][][
        #project_data.advisor][
        ][][][
          #project_data.thirdline_role\
          #project_data.thirdline_credentials
        ][][
          #project_data.thirdline_name
        ]

]]
] <title_page>