# Multi Stage Docker File
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS Base

# Metadata Serves as In-Image Documentation
LABEL org.opencontainers.Image.description="Image for Payment Service" \
      Image.Title="Crickbuzz.Payment" \
      Version="Version-1"

ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8

WORKDIR /app

EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:80 AS Build

# Passed in arguments in CI Pipeline Build JOb or pass the value at build time with docker build
ARG ACCESSTOKEN 

RUN dotnet nuget add source https:crickbuzz.pkgs....... $ACCESSTOKEN

WORKDIR /source

COPY . .

RUN dotnet restore
RUN dotnet build Cb.Payment.sln

WORKDIR /source/Cb.Payment.RestService/

RUN dotnet publish Cb.Payment.RestService.csproj -c Release -o /app

FROM Build AS Test

ENV PATH="$PATH:/root/.dotnet/tools"

RUN  dotnet tools install -- global coverlet.console --Version 1.7.2
WORKDIR /source

RUN dotnet test Cb.Payment.Lib.XUnitTests/Cb.Payment.Lib.XUnitTests.csproj /p:CollectCoverage=true ......

RUN dotnet build-server shutdown

FROM Base AS Final
RUN apk add --no-cache fontconfig && fc-cache -f -v
WORKDIR /app

# Copy files from /app in build stage to current directory
COPY --from=Build /app . 

ENTRYPOINT [ "dotnet", "Cb.Payment.RestService.dll" ]

