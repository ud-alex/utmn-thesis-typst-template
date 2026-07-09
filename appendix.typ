#let appendix_counter = counter("app_counter") 

#let appendix = (appendix_title) => {
  appendix_counter.step()
  align(top+right)[
    #box(height: 1cm)[ #context {heading(numbering: none)[
      ПРИЛОЖЕНИЕ #appendix_counter.display()]}
      ]
  ]
  context heading(outlined: false, numbering: none)[
    #appendix_title
    ]
}
