local M = {}

M.config = {
  openai_params = {
    model = "gpt-4",
    max_tokens = 4095,
    temperature = 0.2,
    top_p = 0.1,
    n = 1,
  },
}

function M.setup()
  require("chatgpt").setup(M.config)
end

return M

