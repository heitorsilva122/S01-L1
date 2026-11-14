(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva "Agressiva")
    (:leviata "Leviata: mantenha distancia")
    (otherwise "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "Nome: ~A | Bioma: ~A | Profundidade: ~A metros | Perigo: ~A"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de-metros (catalogo metros)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros)) catalogo))

(defparameter *catalogo*
  (list
   (make-criatura :nome "Peep" :bioma "Grandes Recifes" :profundidade 10 :perigo :inofensiva)
   (make-criatura :nome "Stalker" :bioma "Florestas de Algas" :profundidade 45 :perigo :agressiva)
   (make-criatura :nome "Reaper Leviathan" :bioma "Crash Zone" :profundidade 120 :perigo :leviata)
   (make-criatura :nome "Cuddlefish" :bioma "Grutas Marinhas" :profundidade 200 :perigo :inofensiva)))

(defun main ()
  (format t "--- CATALOGO COMPLETO ---~%")
  (dolist (desc (mapcar #'descreve-criatura *catalogo*))
    (format t "~A~%" desc))
  (format t "~%--- CRIATURAS ABAIXO DE 40 METROS ---~%")
  (let ((filtradas (abaixo-de-metros *catalogo* 40)))
    (dolist (c filtradas)
      (format t "~A~%" (descreve-criatura c)))
    (format t "Total de criaturas: ~A~%" (length filtradas))))

(main)