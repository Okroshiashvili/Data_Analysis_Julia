### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ c9b0cf1a-620d-42de-b079-3d7291f6587b
begin
	using Pkg
    Pkg.activate(".")
end

# ╔═╡ fbe88aeb-b570-46f4-a583-a7c8de8b03c7
begin
	using JSON
	using Queryverse
	using DataFrames
end

# ╔═╡ 46b3c930-16b5-44af-b80e-01b5d20cd1d8
md"**In this notebook, I will review how to read and write tabular data from and to to different types of files**"

# ╔═╡ 6e3bc131-82c2-4c2d-8d17-6cfa9d259324
# Julia version

VERSION

# ╔═╡ c653575e-ddec-4215-b68d-1a7271d2bf15
md"### Import packages"

# ╔═╡ 3a030895-0a6f-425e-892b-8dbeda941eb2
md"### Read and Write CSV file"

# ╔═╡ aa403575-9639-440b-8894-87a5a252d10b
# Read file

# ╔═╡ 39a5fcb4-710c-4a2d-9a91-926fa46321f9
df_csv = DataFrame(load("data/admission.csv"))

# ╔═╡ d39c3283-ed6d-4e37-bead-374c8a1d0005
# Write file

# ╔═╡ 5337f2b2-f4a1-4e0e-9fd6-98156bb2cdae
save("data/file_name_you_want.csv", df_csv)

# ╔═╡ ed66f6ad-f6fa-46a4-99fc-dd0c77641efa
md"## Read and Write Excel file"

# ╔═╡ 96cbfd6a-8047-4f5b-9a9a-71a7f288a638
# Read file

# ╔═╡ 813bf96e-5b70-4374-bd16-977b76b377a9
df_excel = DataFrame(load("data/titanic.xlsx", "train"))

# ╔═╡ e29dc438-0c2a-4291-acff-071816686bf3
# Write file

# ╔═╡ 257f248b-6ba3-4572-8d64-a26c4ac08b79
save("data/file_name_you_want.xlsx", df_excel)

# ╔═╡ df5eb6d3-fdc7-4ded-89b1-51ecd4d2f1eb
md"### Read Stata file"

# ╔═╡ 3cb86352-0142-4e53-802d-815e0087d8c6
# Read file

# ╔═╡ 21767dac-d9f8-4bfa-9f95-be24fc300a0a
df_stata = DataFrame(load("data/airline.dta"))

# ╔═╡ 377b30d1-1116-4803-aabb-f64e640130bf
md"**Write Stata file is not yet supported**"

# ╔═╡ ebf5e628-29bf-4a5c-b667-3d06e50527b4
md"### Read SPSS file"

# ╔═╡ 4158f1c6-0d2e-408f-ac11-0d29d17fc1ad
# Read file

# ╔═╡ b8ef0164-f076-45e1-b5d4-95b7683984fb
df_spss = DataFrame(load("data/sleep.sav"))

# ╔═╡ 9d226c89-a4f1-49f1-8f11-166a6a36e258
md"**Write SPSS file is not yet supported**"

# ╔═╡ 1713fab1-7c50-498a-8759-e7df9c076010
md"### Read SaS file"

# ╔═╡ 7e620b25-bdfb-4dc8-adcb-5655bc654c67
# Read file

# ╔═╡ 1dbb2c5c-daba-47ed-ae25-6cf53748d151
df_sas = DataFrame(load("data/alcohol.sas7bdat"))

# ╔═╡ f75a2b41-55da-43a4-a3c0-b5422ee29476
md"**Write SaS file is not yet supported**"

# ╔═╡ Cell order:
# ╟─46b3c930-16b5-44af-b80e-01b5d20cd1d8
# ╠═c9b0cf1a-620d-42de-b079-3d7291f6587b
# ╠═6e3bc131-82c2-4c2d-8d17-6cfa9d259324
# ╟─c653575e-ddec-4215-b68d-1a7271d2bf15
# ╠═fbe88aeb-b570-46f4-a583-a7c8de8b03c7
# ╟─3a030895-0a6f-425e-892b-8dbeda941eb2
# ╠═aa403575-9639-440b-8894-87a5a252d10b
# ╠═39a5fcb4-710c-4a2d-9a91-926fa46321f9
# ╠═d39c3283-ed6d-4e37-bead-374c8a1d0005
# ╠═5337f2b2-f4a1-4e0e-9fd6-98156bb2cdae
# ╟─ed66f6ad-f6fa-46a4-99fc-dd0c77641efa
# ╠═96cbfd6a-8047-4f5b-9a9a-71a7f288a638
# ╠═813bf96e-5b70-4374-bd16-977b76b377a9
# ╠═e29dc438-0c2a-4291-acff-071816686bf3
# ╠═257f248b-6ba3-4572-8d64-a26c4ac08b79
# ╟─df5eb6d3-fdc7-4ded-89b1-51ecd4d2f1eb
# ╠═3cb86352-0142-4e53-802d-815e0087d8c6
# ╠═21767dac-d9f8-4bfa-9f95-be24fc300a0a
# ╟─377b30d1-1116-4803-aabb-f64e640130bf
# ╟─ebf5e628-29bf-4a5c-b667-3d06e50527b4
# ╠═4158f1c6-0d2e-408f-ac11-0d29d17fc1ad
# ╠═b8ef0164-f076-45e1-b5d4-95b7683984fb
# ╟─9d226c89-a4f1-49f1-8f11-166a6a36e258
# ╟─1713fab1-7c50-498a-8759-e7df9c076010
# ╠═7e620b25-bdfb-4dc8-adcb-5655bc654c67
# ╠═1dbb2c5c-daba-47ed-ae25-6cf53748d151
# ╟─f75a2b41-55da-43a4-a3c0-b5422ee29476
