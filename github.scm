(use-modules (web client) (ice-9 receive) (rnrs bytevectors) (json))

(define     URL_BASE         "https://api.github.com")
(define CONTENT_TYPE "application/vnd.github.v3+json")
(define   USER_AGENT              "Guile Octokit SDK")

(define (github~convert-api-call callBody)
  (json-string->scm (utf8->string callBody)))

(receive (header body)
    (http-get
      (string-append URL_BASE "/users/WammKD")
      #:headers `((User-Agent .   ,USER_AGENT)
                  (Accept     . ,CONTENT_TYPE)))
  (hash-ref (github~convert-api-call body) "avatar_url"))
