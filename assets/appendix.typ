#let appendix_counter = counter("app_counter")

#let appendix(appendix_title, app_supplement: "Прил.", numbering: "default") = {
  figure(supplement: app_supplement, kind: "appendix", block(width: 100%, {

    appendix_counter.step()

    if numbering != "default"{
      appendix_counter.update(numbering)}

    let app_numbering = if numbering == "default"  {context appendix_counter.display()} else {numbering}

    align(top + right)[
      #box(height: 1cm)[ #context {
          heading(numbering: none)[
            ПРИЛОЖЕНИЕ #app_numbering]
        }
      ]
    ]
    
    context heading(outlined: false, numbering: none)[
      
      #appendix_title
    ]
  }))
}
