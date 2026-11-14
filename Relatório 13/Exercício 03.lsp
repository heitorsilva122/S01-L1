(defstruct garota-magica
  nome
  escuridao
  bruxas)

(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

(defun purifica (g quantidade)
  (let ((nova-escuridao (if (>= quantidade (garota-magica-escuridao g))
                            0
                            (- (garota-magica-escuridao g) quantidade))))
    (make-garota-magica
     :nome (garota-magica-nome g)
     :escuridao nova-escuridao
     :bruxas (garota-magica-bruxas g))))

(defun main ()
  (let* ((grupo1 (list
                  (make-garota-magica :nome "Madoka" :escuridao 20 :bruxas 5)
                  (make-garota-magica :nome "Homura" :escuridao 40 :bruxas 12)
                  (make-garota-magica :nome "Sayaka" :escuridao 70 :bruxas 8)))
         (nova-garota (make-garota-magica :nome "Kyoko" :escuridao 30 :bruxas 10))
         (grupo2 (cons nova-garota grupo1)))
    (format t "Grupo 1 - Escuridao total: ~A~%" (escuridao-total grupo1))
    (format t "Grupo 1 - Total de bruxas: ~A~%" (total-de-bruxas grupo1))
    (format t "Grupo 2 (com nova garota) - Escuridao total: ~A~%" (escuridao-total grupo2))
    (let ((original (car grupo1)))
      (let ((purificada (purifica original 25)))
        (format t "Original (~A) escuridao: ~A~%" (garota-magica-nome original) (garota-magica-escuridao original))
        (format t "Purificada (~A) escuridao: ~A~%" (garota-magica-nome purificada) (garota-magica-escuridao purificada))))))

(main)