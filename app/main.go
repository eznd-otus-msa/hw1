package main

import (
    "fmt"
    "github.com/gin-gonic/gin"
    "net/http"
    "os"
)

func main() {
    r := gin.Default()
    _ = r.SetTrustedProxies(nil)

    r.GET("/health", respondOk)
    r.GET("/probe/live", respondOk)
    r.GET("/probe/ready", respondOk)

    port := os.Getenv("PORT")
    if port == "" {
        port = "8000"
    }
    _ = r.Run(fmt.Sprintf(":%s", port))
}

func respondOk(c *gin.Context) {
    c.JSON(http.StatusOK, gin.H{
        "status": "OK",
    })
}
