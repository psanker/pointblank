% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/table_transformers.R
\name{tt_tbl_colnames}
\alias{tt_tbl_colnames}
\title{Table Transformer: get a table's column names}
\usage{
tt_tbl_colnames(tbl)
}
\arguments{
\item{tbl}{A table object to be used as input for the transformation. This
can be a data frame, a tibble, a \code{tbl_dbi} object, or a \code{tbl_spark} object.}
}
\value{
A \code{tibble} object.
}
\description{
With any table object, you can produce a summary table that contains table's
column names. The output summary table will have two columns and as many rows
as there are columns in the input table. The first column is the \code{".param."}
column, which is an integer-based column containing the indices of the
columns from the input table. The second column, \code{"value"}, contains the
column names from the input table.
}
\section{Examples}{


Get the column names of the \code{game_revenue} dataset that is included in the
\strong{pointblank} package.

\if{html}{\out{<div class="sourceCode r">}}\preformatted{tt_tbl_colnames(tbl = game_revenue)
}\if{html}{\out{</div>}}

\if{html}{\out{<div class="sourceCode">}}\preformatted{## # A tibble: 11 × 2
##    .param. value           
##      <int> <chr>           
##  1       1 player_id       
##  2       2 session_id      
##  3       3 session_start   
##  4       4 time            
##  5       5 item_type       
##  6       6 item_name       
##  7       7 item_revenue    
##  8       8 session_duration
##  9       9 start_day       
## 10      10 acquisition     
## 11      11 country
}\if{html}{\out{</div>}}

This output table is useful when you want to validate the column names of the
table. Here, we check that \code{game_revenue} table, included in the
\strong{pointblank} package, has certain column names present with
\code{\link[=test_col_vals_make_subset]{test_col_vals_make_subset()}}.

\if{html}{\out{<div class="sourceCode r">}}\preformatted{tt_tbl_colnames(tbl = game_revenue) \%>\%
  test_col_vals_make_subset(
    columns = vars(value),
    set = c("acquisition", "country")
  )
}\if{html}{\out{</div>}}

\if{html}{\out{<div class="sourceCode">}}\preformatted{## [1] TRUE
}\if{html}{\out{</div>}}

We can check to see whether the column names in the \code{specifications} table
are all less than \code{15} characters in length. For this, we would use the
combination of \code{tt_tbl_colnames()}, then \code{\link[=tt_string_info]{tt_string_info()}}, and finally
\code{\link[=test_col_vals_lt]{test_col_vals_lt()}} to perform the test.

\if{html}{\out{<div class="sourceCode r">}}\preformatted{specifications \%>\%
  tt_tbl_colnames() \%>\%
  tt_string_info() \%>\%
  test_col_vals_lt(
    columns = vars(value),
    value = 15
  )
}\if{html}{\out{</div>}}

\if{html}{\out{<div class="sourceCode">}}\preformatted{## [1] FALSE
}\if{html}{\out{</div>}}

This returned \code{FALSE} and this is because the column name
\code{credit_card_numbers} is 16 characters long.
}

\section{Function ID}{

12-4
}

\seealso{
Other Table Transformers: 
\code{\link{get_tt_param}()},
\code{\link{tt_string_info}()},
\code{\link{tt_summary_stats}()},
\code{\link{tt_tbl_dims}()},
\code{\link{tt_time_shift}()},
\code{\link{tt_time_slice}()}
}
\concept{Table Transformers}
