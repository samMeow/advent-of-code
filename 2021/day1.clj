(ns day1)
(import '(java.io BufferedReader))

(def input
  (map #(Integer/parseInt %) (line-seq (BufferedReader. *in*)))
)

(def temp
  (map vector (into [] input) (rest (into [] input)))
)

(defn smaller [a b]
  (if (< a b) 1 0)
)

(defn sol [pairs]
  (reduce 
    #(let [[a b] %2] (+ %1 (smaller a b)))
    0
    pairs
  )
)

(defn main []
  doall (println (sol temp))
)

(main)