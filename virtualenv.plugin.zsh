function virtualenv_prompt_info(){
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "${ZSH_THEME_VIRTUALENV_PREFIX=[}${VIRTUAL_ENV:t:gs/%/%%}${ZSH_THEME_VIRTUALENV_SUFFIX=]}"
}

# Disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Also handle the presence of conda. The following works also 
# if conda is part of an environment managed by pyenv.
# Note: conda does not set VIRTUAL_ENV, while pyenv does.
function virtualenv_conda_prompt_info(){
  [[ -n ${VIRTUAL_ENV} || -n ${CONDA_PREFIX} ]] || return
  local env_info=${VIRTUAL_ENV:-$CONDA_PREFIX}
  echo "${ZSH_THEME_VIRTUALENV_PREFIX=[}${env_info:t:gs/%/%%}${ZSH_THEME_VIRTUALENV_SUFFIX=]}"
}

if [[ -n ${CONDA_EXE} ]]; then
  # https://stackoverflow.com/questions/36499220/
  # https://stackoverflow.com/questions/54429210/
  # This modifies ~/.condarc
  conda config --set changeps1 False
  conda config --set auto_activate_base False
fi
