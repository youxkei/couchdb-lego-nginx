.env.example: .env
	perl -pe 's/=.*/=/' .env > .env.example
