(define (domain maze-world)
	(:requirements :typing)
	(:types cell adventurer)
	(:predicates
		(in-cell ?a - adventurer ?c - cell)
		(adjacent ?a - cell ?b - cell)
		(has-wall ?a - cell)
	)
	(:action move-cells
		:parameters (?a - cell ?b - cell ?c - adventurer)
		:precondition (and
			(adjacent ?a ?b)
			(in-cell ?c ?a)
			(not (has-wall ?b))
		)
		:effect (and
			(not (in-cell ?c ?a))
			(in-cell ?c ?b)
			)
	)
)
