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

(defun winner (play1 play2)
  ; (format t "Play 1: ~A   Play 2: ~A~%" play1 play2)
  (cond
    ((and (string= play1 "rock") (string= play2 "rock")) 0)
    ((and (string= play1 "rock") (string= play2 "paper")) 2)
    ((and (string= play1 "rock") (string= play2 "scissors")) 1)
    ((and (string= play1 "paper") (string= play2 "rock")) 1)
    ((and (string= play1 "paper") (string= play2 "paper")) 0)
    ((and (string= play1 "paper") (string= play2 "scissors")) 2)
    ((and (string= play1 "scissors") (string= play2 "rock")) 2)
    ((and (string= play1 "scissors") (string= play2 "paper")) 1)
    ((and (string= play1 "scissors") (string= play2 "scissors")) 0)
    ))

(defun single-game ()
  (let ((result (winner (prompt) (computer-play))))
    (cond
      ((= result 0) '"draw")
      ((= result 1) '"player")
      ((= result 2) '"computer"))))

(defun game ()
  (let ((result (single-game)))
    (if (string= result "draw")
        '"Its a Draw!"
        (if (string= result "player")
            '"You Win!"
            '"You Loose!"))))
