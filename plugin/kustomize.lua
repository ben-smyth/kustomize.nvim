local fn = vim.fn
-- local api = vim.api
local health = vim.health
local _error = health.error
local _ok = health.ok

-- local test = io.popen("kustomize build ~/GIT/kubernetesRepoOne/deployments/prod/")
-- local output = test:read("a*")
-- test:close()
-- if output == nil then
-- 	print("kustomize failed")
-- end
-- print(output)

local function findKustomizationFiles(targetDir)
	if targetDir == nil then
		targetDir = "."
	end

	local foundFiles = {}
	local p = io.popen('find ' ..targetDir.. ' -type f \\( -name "kustomization.yaml" -o -name "kustomization.yml" -name "Kustomization" \\)')
	for file in p:lines() do
		table.insert(foundFiles, file)
	end
	p:close()
	return foundFiles
end

local function verifyKustomizeInstalled()
	if fn.executable "kstomize" == 0 then
		_error("`git` executable not found.", {
			"Install it with your package manager.",
			"Check that your `$PATH` is set correctly.",
		})
	else
		_ok "`git` executable found."
	end
end

local function kustomizeBuild(targetFileOrDir)

end

local function kustomizeBuildList(listOfFilesOrDirs)

end

local function kustomizeBuildCurrentBuffer()

end

-- local foundFiles = findKustomizationFiles()
--
-- for _, file in ipairs(foundFiles) do
-- 	print(file)
-- end

verifyKustomizeInstalled()
