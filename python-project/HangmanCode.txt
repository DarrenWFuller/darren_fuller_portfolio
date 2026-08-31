import random

words = ["computer", "software", "hardware", "database", "compiler", "function", "protocol", "variable", "keyboard", "terminal"]

secret_word = random.choice(words)
secret_letters = list(secret_word)

attempts = 6
prev_guesses = []

disp_letters = ["_"] * len(secret_word)

print("Let's play Hangman!\n")

while attempts > 0 and "_" in disp_letters:
    print("Word:", " ".join(disp_letters))
    guess = input("Guess a letter: ").lower()
    
    if guess in prev_guesses:
        print("You already guessed that letter!")
        continue
    else:
        prev_guesses.append(guess)

    if guess not in secret_letters:
        attempts -= 1
        print(f"No {guess}'s! {attempts} mistakes until game over.")
        continue
    
    for i in range(len(secret_letters)):
        if secret_letters[i] == guess:
            disp_letters[i] = guess

    print("Good guess!\n")

if "_" not in disp_letters:
    print("You win! The word was:", secret_word)
else:
    print("Game over! The word was:", secret_word)
