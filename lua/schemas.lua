return {
  json = {
    {
      fileMath = { 'package.json' },
      url = 'https://json.schemastore.org/package.json',
    },
    {
      fileMatch = { 'tsconfig*.json', 'jsconfig*.json' },
      url = 'https://json.schemastore.org/tsconfig.json',
    },
    {
      fileMatch = {
        '.prettierrc',
        '.prettierrc.json',
        'prettier.config.json',
      },
      url = 'https://json.schemastore.org/prettierrc.json',
    },
    {
      fileMatch = { '.eslintrc', '.eslintrc.json' },
      url = 'https://json.schemastore.org/eslintrc.json',
    },
    {
      fileMatch = { '.babelrc', '.babelrc.json', 'babel.config.json' },
      url = 'https://json.schemastore.org/babelrc.json',
    },
    {
      fileMatch = { 'lerna.json' },
      url = 'https://json.schemastore.org/lerna.json',
    },
    {
      fileMatch = { 'now.json', 'vercel.json' },
      url = 'https://json.schemastore.org/now.json',
    },
    {
      fileMatch = {
        '.stylelintrc',
        '.stylelintrc.json',
        'stylelint.config.json',
      },
      url = 'http://json.schemastore.org/stylelintrc.json',
    },
  },
  yaml = {
    ['http://json.schemastore.org/gitlab-ci.json'] = { '.gitlab-ci.yml' },
    ['https://json.schemastore.org/bamboo-spec.json'] = {
      'bamboo-specs/*.{yml,yaml}',
    },
    ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = {
      'docker-compose*.{yml,yaml}',
    },
    ['http://json.schemastore.org/github-workflow.json'] = '.github/workflows/*.{yml,yaml}',
    ['http://json.schemastore.org/github-action.json'] = '.github/action.{yml,yaml}',
    ['http://json.schemastore.org/prettierrc.json'] = '.prettierrc.{yml,yaml}',
    ['http://json.schemastore.org/stylelintrc.json'] = '.stylelintrc.{yml,yaml}',
    ['http://json.schemastore.org/circleciconfig'] = '.circleci/**/*.{yml,yaml}',
  },
}
