#' check type sanity
#'
#' @param model model object
#' @param type character vector
#' @noRd
sanitize_type <- function(model, type, calling_function = "raw") {

    # tidymodels
    if (inherits(model, "model_fit")) {
        if (is.null(type)) type <- "response"
        insight::check_if_installed("parsnip")
        fun <- utils::getFromNamespace("check_pred_type", "parsnip")
        fun(model, type)
        return(type)
    }

    # mlr3
    if (inherits(model, "Learner")) {
        if (is.null(type)) type <- "response"
        valid <- setdiff(model$predict_types, "se")
        checkmate::assert_choice(type, choices = valid, null.ok = TRUE)
        return(type)
    }

    # if (is.null(type)) {
    #     return(type)
    # }

    checkmate::assert_character(type, len = 1, null.ok = TRUE)
    cl <- class(model)[1]
    if (!cl %in% type_dictionary$class) {
        cl <- "other"
    }
    dict <- type_dictionary
    # raw is often invoked by `get_predict()`, which is required for {clarify} and others.
    # we only allow invlink(link) in predictions() and marginal_means(), which are handled by {marginaleffects}
    if (!calling_function %in% c("predictions", "marginal_means")) {
        dict <- dict[dict$type != "invlink(link)", , drop = FALSE]
    }

    # fixest: invlink(link) only supported for glm model
    if (inherits(model, "fixest")) {
        if (!isTRUE(hush(model[["method_type"]]) %in% c("feglm"))) {
            dict <- dict[dict$type != "invlink(link)", , drop = FALSE]
        }
    }

    dict <- dict[dict$class == cl, , drop = FALSE]
    checkmate::assert_choice(type, choices = dict$type, null.ok = TRUE)
    if (is.null(type)) {
        type <- dict$type[1]
    }
    return(type)
}