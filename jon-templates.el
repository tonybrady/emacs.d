(auto-insert-mode t)
(add-to-list
 'auto-insert-alist
 '(("\\.html?$" . "HTML file template")
   "Page title: "
   "<!DOCTYPE html>
<html>
  <head>
    <meta charset='utf-8'>\n
    <title>" str "</title>\n
  </head>
  <body>\n
    <h1>" str "</h1>\n
    " _ "\n
  </body>
</html>"))
(add-to-list
 'auto-insert-alist
 '(("layout.haml$" . "HAML layout")
   "Page title: "
   "!!! strict
%html{ :xmlns => 'http://www.w3.org/1999/xhtml' }
  %head
    %meta{ 'http-equiv' => 'Content-Type', :content => 'text/html; charset=utf-8' }
    %title= '" str "'
    %link{ 'type' => 'text/css', 'rel' => 'stylesheet', 'href' => '" - "' }
  %body
    = yield"))

(provide 'jon-templates)
