/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

struct command {
	char *key;
	char *val;
};

#define COMMAND(a)  {a, a}
#define ALIAS(a, b) {a, b}

static const struct command commands[] = {
	COMMAND("qutebrowser"),
	ALIAS("hibernate", "st sh -c \"sudo tee /sys/power/state <<< disk\""),
	ALIAS("emacs", "emacsclient -ca \"\"")
};

static int topbar = 0;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"ibm:size=14"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#bbbbbb", "#222222" },
	[SchemeSel] = { "#eeeeee", "#005577" },
	[SchemeOut] = { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
