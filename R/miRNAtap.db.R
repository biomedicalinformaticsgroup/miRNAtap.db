#' @docType package
#' @name miRNAtap.db
#' @title database for miRNAtap package
#' @details This package contains data annotations (target predictions).
#' @import DBI RSQLite AnnotationDbi miRNAtap
#' @author Maciej Pajak \email{m.pajak@@sms.ed.ac.uk}, Ian Simpson 
#' @examples
#' #direct targets in mouse aggregated from all sources:
#' library(miRNAtap)
#' targets_mouse <- getPredictedTargets('let-7a',species='mmu', method='geom')
NULL




#####################
#        .onLoad
#####################
.onLoad <- function(libname, pkgname) {
    pkgname <- 'miRNAtap.db'
    
    db <- loadDb(system.file("extdata",'targetpredictor_db.sqlite',
                            package=pkgname,lib.loc=libname))
    
    dbNewname <- AnnotationDbi:::dbObjectName(pkgname,'MirnaDb')
    ns <- asNamespace(pkgname)
    assign(dbNewname, db, envir=ns)
    namespaceExport(ns, dbNewname)
}

## library(AnnotationDbi); trace("loadDb", browser, signature = c("character", 
## "character", "character")); library(org.Xl.eg.db)

## library(targetPredictor); trace("loadDb", browser, signature = 
## c("character", "character", "character")); library(targetPredictor.db)

## In second case, the WRONG value was passed in for dbPackage.    
## We *want* it to be 'targetPredictor' and instead we have 'targetPredictor.db'
