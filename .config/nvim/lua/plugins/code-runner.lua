return {

---[[
    --Code Runner
    "CRAG666/code_runner.nvim",
    opts = {
        mode = toggleterm,
        focus = true,
        filetype = {
            java = {
                "cd $dir &&",
                "javac $fileName &&",
                "java $fileNameWithoutExt"
            },
            python = {
                "cd $dir &&",
                "python -u $fileName"
            },
            typescript = "deno run",
            rust = {
                "cd $dir &&",
                "rustc $fileName &&",
                "$dir/$fileNameWithoutExt"
            },
            c = {
                "cd $dir &&",
                "gcc $fileName -o $fileNameWithoutExt &&",
                "$dir/$fileNameWithoutExt",
                },
            cpp = {
                "cd $dir &&",
                "g++ -std=c++23 $fileName -o $fileNameWithoutExt &&",
                "$dir/$fileNameWithoutExt",
                },
            sh = "bash",
            tex = {
                "cd $dir &&",
                "xelatex $filename &&",
                "zathura $filename.pdf"
            }
        },
    },
--]]
}
