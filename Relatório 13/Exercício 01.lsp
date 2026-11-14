(defstruct erva
  nome
  preco-por-grama
  toxicidade)

(defun classifica-erva (e)
  (cond
    ((>= (erva-toxicidade e) 7) "veneno")
    ((<= 4 (erva-toxicidade e) 6) "use com cuidado")
    (t "segura")))

(defun preco-da-dose (e gramas)
  (* (erva-preco-por-grama e) gramas))

(defun descreve-erva (e)
  (format nil "Nome: ~A | Preco por grama: R$ ~,2F | Classificacao: ~A"
          (erva-nome e)
          (erva-preco-por-grama e)
          (classifica-erva e)))

(defun aviso (e)
  (if (>= (erva-toxicidade e) 7)
      "Maomao vai testar a erva em si mesma antes"
      "Erva liberada para o paciente"))

(defun main ()
  (let ((estoque (list
                  (make-erva :nome "Noz de Imperio" :preco-por-grama 15.50 :toxicidade 9)
                  (make-erva :nome "Raiz Amarga" :preco-por-grama 8.00 :toxicidade 5)
                  (make-erva :nome "Folha Doce" :preco-por-grama 3.25 :toxicidade 1))))
    (dolist (e estoque)
      (format t "~A~%" (descreve-erva e))
      (format t "~A~%~%" (aviso e)))
    (format t "Preco de uma dose (10g) da primeira erva: R$ ~,2F~%" 
            (preco-da-dose (car estoque) 10))))

(main)