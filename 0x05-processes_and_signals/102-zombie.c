#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>


/**
 * infinite_while - Loops indefinitely, pauses for one second between
 *                  each iteration.
 */
void infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
}

/**
 * main - Entry point to the program.
 * Return: Always 0
 */
int main(void)
{
	pid_t pid;
	int i;

	for (i = 0; i < 5; i++)
	{
		pid = fork();
		if (pid < 0)
			exit(EXIT_FAILURE);
		else if (pid == 0)
			exit(EXIT_SUCCESS);
		else
			printf("Zombie process created, PID: %d\n", pid);
	}

	infinite_while();

	return (0);
}
