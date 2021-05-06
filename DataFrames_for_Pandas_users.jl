### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ aacaa1cd-8102-4fb8-950b-e2f407ed3c57
begin
	using Statistics
	using StatsBase
	using Dates
	using CSV
	using DataFrames
	using Pipe
	using FreqTables
	using PyPlot
	using Plots
end

# ╔═╡ e43c78f6-ada2-11eb-1d8d-295dd9d386fb
md"""
# An introduction to `DataFrames.jl` for Pandas users


---

In this notebook, I follow [PyCon 2018: Using pandas for Better (and Worse) Data Science](https://nbviewer.jupyter.org/github/justmarkham/pycon-2018-tutorial/blob/master/tutorial.ipynb) and [PyData Global 2020](https://github.com/bkamins/PyDataGlobal2020/blob/main/police.ipynb) to convert `Pandas` into `DataFrames.jl`

---

> Note: I put Python equivalent code on top of the Julia code
"""

# ╔═╡ e5a0d746-9f46-4b1b-aea2-2620cf8add93
md"Read the data"

# ╔═╡ 91736a19-cc75-46be-b820-3fe47c21e151
# df = pd.read_csv("data/police.csv")

df = DataFrame(CSV.File("data/police.csv"))

# ╔═╡ 56ddc92a-a866-4e03-8a11-18d39df923e1
md"Check how many row and columns we have, as well as the types of each column"

# ╔═╡ 769c439a-d455-4339-aef4-a74e890c8860
# df.shape

size(df)

# ╔═╡ 2e5bd752-476f-47fc-906c-8bde86d0a088
# df.dtypes

eltype.(eachcol(df))

# ╔═╡ c43dce24-e66e-42fd-ace6-4358f2247cab
# df.dtypes

describe(df, :eltype)

# ╔═╡ 55b5ef73-56d3-4053-8c20-aaf3ec27a425
# df.head()

first(df, 5)

# ╔═╡ 7421d4e5-2e2e-4ba4-a4ab-a7b0f844418f
# df.columns

names(df)

# ╔═╡ 8336ff80-2baf-4383-ae2d-f7dfc98c47bd
md"Count missing values"

# ╔═╡ 4e67a951-db93-47ab-a1fd-cfc48b71a91b
# df.isna().sum()

describe(df, :nmissing)

# ╔═╡ b158685f-81ff-4215-8c8a-c68b6c84aa79
md"## 1. Remove columns having all missing values"

# ╔═╡ a74e7764-c3d5-40c8-a67e-ba661778ff0a
# df.drop("county_name", axis=1, inplace=True)

select!(df, Not("county_name"))

# ╔═╡ ca0381c4-b5bf-4f67-aac3-d88c000ec2c5
md"If we want to remove rows containing missing values, we can do that using following ways"

# ╔═╡ 9dbbe017-2c3e-4cfb-88b5-6232fe8e182e
# df.dropna(how="all")

dropmissing(df, :)

# ╔═╡ 80c58ce0-47d7-440d-aac5-207c943fb226
md"## 2. Do men or women speed more often?"

# ╔═╡ ef6d3bce-5cc5-4fc9-8f62-b59d9e1dee9d
md"when someone is stopped for speeding, how often is it a man or woman?"

# ╔═╡ 864dd267-57f2-4660-b15e-41b8ebae7ba7
# df[df.violation == 'Speeding'].driver_gender.value_counts()

df[isequal.(df.violation, "Speeding"), "driver_gender"] |> countmap

# ╔═╡ dc056aef-156e-4523-bbdf-b16ddf393bb3


# ╔═╡ 9e500949-5ec2-46d0-aa0f-465ef166c193


# ╔═╡ 84dd6fe6-8611-4f8c-95ce-59da7ad94663


# ╔═╡ Cell order:
# ╟─e43c78f6-ada2-11eb-1d8d-295dd9d386fb
# ╠═aacaa1cd-8102-4fb8-950b-e2f407ed3c57
# ╟─e5a0d746-9f46-4b1b-aea2-2620cf8add93
# ╠═91736a19-cc75-46be-b820-3fe47c21e151
# ╟─56ddc92a-a866-4e03-8a11-18d39df923e1
# ╠═769c439a-d455-4339-aef4-a74e890c8860
# ╠═2e5bd752-476f-47fc-906c-8bde86d0a088
# ╠═c43dce24-e66e-42fd-ace6-4358f2247cab
# ╠═55b5ef73-56d3-4053-8c20-aaf3ec27a425
# ╠═7421d4e5-2e2e-4ba4-a4ab-a7b0f844418f
# ╟─8336ff80-2baf-4383-ae2d-f7dfc98c47bd
# ╠═4e67a951-db93-47ab-a1fd-cfc48b71a91b
# ╟─b158685f-81ff-4215-8c8a-c68b6c84aa79
# ╠═a74e7764-c3d5-40c8-a67e-ba661778ff0a
# ╟─ca0381c4-b5bf-4f67-aac3-d88c000ec2c5
# ╠═9dbbe017-2c3e-4cfb-88b5-6232fe8e182e
# ╟─80c58ce0-47d7-440d-aac5-207c943fb226
# ╟─ef6d3bce-5cc5-4fc9-8f62-b59d9e1dee9d
# ╠═864dd267-57f2-4660-b15e-41b8ebae7ba7
# ╠═dc056aef-156e-4523-bbdf-b16ddf393bb3
# ╠═9e500949-5ec2-46d0-aa0f-465ef166c193
# ╠═84dd6fe6-8611-4f8c-95ce-59da7ad94663
