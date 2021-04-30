
# Battery Plugin Information
BC=`battery_percentage`
[[ $BC -lt '0' ]] && BC='100'

# Prompt
function prompt_command() {

  username_color=${bold_cyan}
  host_color=${bold_green}
  bracket_color=${bold_white}
  arrow_color=${bold_yellow}
  line_color=${yellow}
  time_color=${bold_purple}
  battery_color=${red}
  current_directory_color=${bold_blue}
  prompt_ending_color=${bold_white}
  cmd_color=${bold_white}
  
  PS1="\n${line_color}╔═${bracket_color}[${username_color}\u${arrow_color} »» ${host_color}\h${bracket_color}]${arrow_color} »» ${bracket_color}[${time_color}\A${bracket_color}]${arrow_color} »» ${bracket_color}(${battery_color}$BC%${bracket_color})\n${line_color}╠═${bracket_color}(${current_directory_color}\w${bracket_color})$(scm_prompt_info)\n${line_color}║\n${line_color}╚═${bracket_color}[${prompt_ending_color}\$${arrow_color} »» ${cmd_color}"

}

# scm theming
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX="${bold_yellow} »» ${bold_black}(${bold_cyan}"
SCM_THEME_PROMPT_SUFFIX="${bold_black})${reset_color}"

safe_append_prompt_command prompt_command

