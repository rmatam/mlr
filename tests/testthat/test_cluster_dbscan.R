context("cluster_dbscan")

test_that("cluster_dbscan", {
  requirePackagesOrSkip("fpc", default.method = "load")

  parset.list = list(
    list()
  )
  old.predicts.list = list()

  for (i in 1:length(parset.list)) {
    parset = parset.list[[i]]
    set.seed(getOption("mlr.debug.seed"))
    m = fpc::dbscan(noclass.train, eps = 1)
    p = as.integer(predict(m, noclass.train, newdata = noclass.test))
    p[p == 0] = NA
    old.predicts.list[[i]] = p
  }

  testSimpleParsets("cluster.dbscan", noclass.df, character(0L), noclass.train.inds,
    old.predicts.list, parset.list)
})
