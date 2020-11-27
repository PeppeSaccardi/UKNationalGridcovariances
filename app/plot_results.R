# PLOTTING FUNCTION DEFINITION
plot_results <- function(i_nup, c){
  if(c %in% 1:39 && i_nup %in% c(0,20,40,80,105)){
    i <- nei_indeces$ii[c]
    j <- nei_indeces$jj[c]
    load(paste0("plots/top",i_nup,"_sign_par/top",i_nup,"_lista_cov.RData"))
    load(paste0("plots/top",i_nup,"_sign_par/top",i_nup,"_lista_cov_sim.RData"))
    sim <- as.matrix(apply(lista_cov_sim[[c]],
                           2, function(x) quantile(x, c(0.025,0.975))), ncol = 48,
                     byrow = TRUE)
    p_mean <- unlist(lapply(lista_cov[[c]], mean))
    p_max <- sim[2,]
    p_min <- sim[1,]
    emp_cov <- lista_ec[[c]]
    plot(emp_cov, type = "l", col = "blue", 
         ylim = c((min(p_min,emp_cov)-0.1),max(p_max,emp_cov)),
         xlab ="",ylab="Covariances", xaxt = 'n')
    lines(p_mean, type = "l", col = "red")
    lines(p_max, lty = 4 , col="green")
    lines(p_min, lty = 4, col="green")
    title(main = paste0("Covariance between \n ",neig[i]," and \n",neig[j]),
          sub = paste0("Using ",i_nup, " unconstrained parameters"))
    l <- c("Empirical covariance","MLE covariance","95% Conf Intervals")
    legend('bottom', legend = l, cex = 0.6,  bty = "n"
           ,lty=c(1,1,2), col = c("blue","red","green"))
    axis(1, at = 1:48, labels = FALSE)
    text(1:48, par("usr")[3]- 0.02, labels = hours, cex = 0.7, srt=45, pos = 1, 
         xpd=TRUE)
    
  }else{
    print(paste0("WARNING: ",i_nup, " or ",c," values not ammitted!"))
  }
}






