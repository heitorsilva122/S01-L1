(defstruct dominio
  nome
  elemento
  dificuldade
  mora)

(defun bonus-elemental (elemento)
  (case elemento
    (:electro 1.5)
    (:hydro 1.2)
    (otherwise 1)))

(defun recompensa-final (d)
  (* (dominio-mora d) (bonus-elemental (dominio-elemento d))))

(defun rota (lista dificuldade-maxima)
  (let* ((filtrados (remove-if-not (lambda (d) (<= (dominio-dificuldade d) dificuldade-maxima)) lista))
         (textos (mapcar (lambda (d)
                           (format nil "Dominio: ~A | Recompensa Final: ~,2F"
                                   (dominio-nome d)
                                   (recompensa-final d)))
                         filtrados)))
    textos))

(defun main ()
  (let ((dominios (list
                   (make-dominio :nome "Jardim do Outono" :elemento :pyro :dificuldade 2 :mora 10000)
                   (make-dominio :nome "Ceu Congelado" :elemento :cryo :dificuldade 4 :mora 15000)
                   (make-dominio :nome "Corte Violeta" :elemento :electro :dificuldade 3 :mora 20000)
                   (make-dominio :nome "Nascente Pura" :elemento :hydro :dificuldade 5 :mora 25000)
                   (make-dominio :nome "Abismo Anemo" :elemento :anemo :dificuldade 1 :mora 5000))))
    (format t "--- ROTA (Dificuldade maxima 3) ---~%")
    (dolist (texto (rota dominios 3))
      (format t "~A~%" texto))
    (format t "~%Total de mora da lista inteira: ~,2F~%"
            (reduce #'+ (mapcar #'recompensa-final dominios)))
    (let* ((original (car dominios))
           (copia (copy-dominio original)))
      (setf (dominio-mora copia) 99999)
      (format t "~%Mora do original (~A): ~,2F~%" (dominio-nome original) (dominio-mora original))
      (format t "Mora da copia (~A): ~,2F~%" (dominio-nome copia) (dominio-mora copia)))))

(main)