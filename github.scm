(use-modules (web client) (ice-9 receive) (rnrs bytevectors) (json))

(define     URL_BASE         "https://api.github.com")
(define CONTENT_TYPE "application/vnd.github.v3+json")



(receive (header body)
    (http-get
      "https://api.github.com/users/WammKD"
      #:headers '((User-Agent . "Awesome-Octocat-App")
                  (Accept     . "application/vnd.github.v3+json")))
  (hash-ref (json-string->scm (utf8->string body)) "avatar_url"))
