(define (domain maze-world)
	(:requirements :typing)
	(:types cell adventurer door)
	(:predicates
		(in-cell ?a - adventurer ?c - cell)
		(adjacent ?a - cell ?b - cell)
		(has-wall ?a - cell)
		(has-door ?a - cell)
		(door-in-cell ?a - cell ?b - door)
		(is-open ?d - door)
	)

	(:action move-cells
		:parameters (?a - cell ?b - cell ?c - adventurer)
		:precondition (and
			(adjacent ?a ?b)
			(in-cell ?c ?a)
			(not (has-wall ?b))
			(not (has-door ?b))
		)
		:effect (and
			(not (in-cell ?c ?a))
			(in-cell ?c ?b)
			)
	)

	(:action move-through-door
		:parameters (?a - cell ?b - cell ?c - cell ?d - door ?e - adventurer)
		:precondition (and
			(adjacent ?a ?b)
			(adjacent ?b ?c)
			(in-cell ?e ?a)
			(not (has-wall ?c))
			(has-door ?b)
			(door-in-cell ?b ?d)
			(is-open ?d)
		)
		:effect (and
			(not (in-cell ?e ?a))
			(in-cell ?e ?c)
			)
	)

	(:action open-door
		:parameters (?a - cell ?b - cell ?d - door ?e - adventurer)
		:precondition (and
			(adjacent ?a ?b)
			(in-cell ?e ?a)
			(has-door ?b)
			(door-in-cell ?b ?d)
		)
		:effect (and
			(is-open ?d)
			)
	)
)
