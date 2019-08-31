(in-package :blag)

(defun links ()
  (with-boilerplate ( "links" "Links")
    (:div :class "row justify-content-center col-md-12"
          (:div :class "card col-md-9 rounded-0 card-border"
                (:div :class "card marg"
                      (:body :class "backPic textColor"
                             (:div :class "d-flex p-2 bg-transparent")
                             (:div
                              (:div :class "row justify-content-center col-md-12"
                                    (:h1 :class "colorBlack chalk"
                                         "Link Tree"))
                              (:div :class "d-flex p-4 bg-transparent"))
                             (:div :class "card col-md-9 bg-transparent colorBlack"
                                   (:h4 "News")
                                   (:div :class "margin-left"
                                         (:p (:a :href "https://news.ycombinator.com/" "Hacker News") ": Paul Graham's startup culture & webdev link aggregator")
                                         (:p (:a :href "https://hackaday.com/" "Hack A Day") ": more computer-engineering-y, hack-y stuff with a mix of tutorials and project breakdowns")
                                         (:p (:a :href "https://lobste.rs/" "Lobsters") ": higher-quality, invite-only HN clone with a few improvements and a focus on PLT")
                                         (:p (:a :href "http://lambda-the-ultimate.org/" "Lambda the Ultimate") ": for those wanting only PLT and nothing else")
                                         (:p (:a :href "https://arstechnica.com/" "Ars Technica") ": more consumer-focused tech news, although some science content and good in-depth reporting keep it a cut above mainstream")
                                         ))
                             (:div :class "d-flex p-4 bg-transparent")
                             (:div :class "d-flex p-4 bg-transparent")
                             (:div :class "card col-md-9 bg-transparent colorBlack"
                                   (:h4 "Lisp")
                                   (:div :class "margin-left"
                                         (:p (:a :href "http://www.gigamonkeys.com/book/" "Practical Common Lisp") ": one of the classic Common Lisp introductions, written for people who already know how to program but not how to Lisp")))))))))
