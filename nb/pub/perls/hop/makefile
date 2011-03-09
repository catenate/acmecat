tests: diff_hanoi_funoi

diff_hanoi_funoi:
	@./hanoi > hanoi.out
	@./funoi > funoi.out
	@diff hanoi.out funoi.out || echo $@ failed
	@rm -f hanoi.out funoi.out
