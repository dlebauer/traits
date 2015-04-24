context("BETYdb")

test_that("BETYdb API works", {
  ## gh-18
  get.out <- GET("https://www.betydb.org/priors.json") # Priors is a small table
  expect_is(get.out, "response")

  expect_null(betydb_yields(genus = "Not A Genus"))
  expect_null(betydb_traits(genus = "Not A Genus"))
  expect_null(betydb_yields(species = "Not A Species"))
  expect_null(betydb_traits(species = "Not A Species"))

  query_yield_genus <- betydb_yields(genus = "Pinus")
  query_yield_species <- betydb_yields(genus = "Miscanthus", species = "giganteus")

  ## This url works:
  ## https://www.betydb.org/traits.json?include[]=variable&include[]=specie&species.genus=Acer&key=eI6TMmBl3IAb7v4ToWYzR0nZYY07shLiCikvT6Lv
  query_traits_genus <- betydb_traits(genus = "Acer")
  query_traits_species <- betydb_yields(genus = "Acer", species = "rubrum")
  a <- betydb_traits(genus = "Miscanthus")
})

test_that("Genus / Species queries work", {
  mxg <- betydb_traits(genus = 'Miscanthus', species = "giganteus", user = "ropensci-traits", pwd = "ropensci")
  pavi <- betydb_traits(genus = 'Panicum', species = "virgatum", user = "ropensci-traits", pwd = "ropensci")
  # expect_false(mxg == pavi) # requires gh-21
}
)
