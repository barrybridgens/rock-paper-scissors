;;; Rock paper Scissors


(defun prompt()
  (format t "Please enter your play (rock / paper / scissors): ")
  (force-output)
  (let ((play (string-downcase (read-line))))
    (if (or (string= play "rock")
            (string= play "paper")
            (string= play "scissors"))
        play
        (prompt))))

(defun computer-play ()
  (let ((number (random 3 (make-random-state t))))
    (cond
      ((= number 0) '"rock")
      ((= number 1) '"paper")
      ((= number 2) '"scissors"))))
